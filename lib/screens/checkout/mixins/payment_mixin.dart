import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools.dart';
import '../../../common/tools/flash.dart';
import '../../../models/booking/booking_model.dart';
import '../../../models/index.dart';
import '../../../modules/analytics/analytics.dart';
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../modules/native_payment/native_payment.dart';
import '../../../services/services.dart';

mixin PaymentMixin<T extends StatefulWidget> on State<T> {
  bool isPaying = false;
  String? selectedId;

  Function? get onBack;

  Function(Order)? get onFinish;
  Function(bool)? get onLoading;

  AppLifecycleListener? _listener;

  CartModel get _cartModel => context.read<CartModel>();
  FeeModel get _feeModel => context.read<FeeModel>();
  UserModel get _userModel => context.read<UserModel>();
  TaxModel get _taxModel => context.read<TaxModel>();
  AppModel get _appModel => context.read<AppModel>();
  PaymentMethodModel get _paymentMethodModel =>
      context.read<PaymentMethodModel>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final langCode = _appModel.langCode;
      final token = _userModel.user?.cookie;

      _paymentMethodModel.getPaymentMethods(
        cartModel: _cartModel,
        shippingMethod: _cartModel.shippingMethod,
        token: token,
        langCode: langCode,
      );

      if (kPaymentConfig.enablePreview == false) {
        _fetchAdditionalFees();
      }
    });
  }

  @override
  void dispose() {
    _listener?.dispose();
    super.dispose();
  }

  Future<void> _fetchAdditionalFees() async {
    final token = _userModel.user?.cookie;

    // Need to fetch fees first before taxes
    await _feeModel.getFees(_cartModel, token, (fees) {
      _cartModel.setFees(fees);
      setState(() {});
    });
    await _taxModel.getTaxes(_cartModel, token, (
      taxesTotal,
      taxes,
      isIncludingTax,
    ) {
      _cartModel.setTaxInfo(taxes, taxesTotal, isIncludingTax);
      setState(() {});
    });
  }

  void showSnackbar() {
    Tools.showSnackBar(ScaffoldMessenger.of(context), S.of(context).processing);
  }

  Future<bool>? createBooking(BookingModel? bookingInfo) async {
    return Services().api.createBooking(bookingInfo)!;
  }

  Future<void> createOrderOnWebsite({
    paid = false,
    bacs = false,
    cod = false,
    AdditionalPaymentInfo? additionalPaymentInfo,
    required Function(Order?) onFinish,
    bool hideLoading = true,
  }) async {
    onLoading!(true);
    await Services().widget.createOrder(
      context,
      paid: paid,
      cod: cod,
      bacs: bacs,
      additionalPaymentInfo: additionalPaymentInfo,
      onLoading: onLoading,
      success: onFinish,
      error: (message) {
        Tools.showSnackBar(ScaffoldMessenger.of(context), message);
      },
    );
    if (hideLoading) {
      onLoading?.call(false);
    }
  }

  Future<void> _deletePendingOrder(String? orderId) async {
    try {
      final userModel = Provider.of<UserModel>(context, listen: false);
      await Services().api.deleteOrder(orderId, token: userModel.user?.cookie);
    } catch (_) {}
  }

  Future<void> createOrder({
    paid = false,
    bacs = false,
    cod = false,
    AdditionalPaymentInfo? additionalPaymentInfo,
  }) async {
    await createOrderOnWebsite(
      paid: paid,
      bacs: bacs,
      cod: cod,
      additionalPaymentInfo: additionalPaymentInfo,
      onFinish: (Order? order) async {
        if (order != null) {
          onFinish!(order);
        }
      },
    );
  }

  void placeOrder(PaymentMethodModel paymentMethodModel, CartModel cartModel) {
    final currencyRate = _appModel.currencyRate;
    final currencyCode =
        cartModel.currencyCode ??
        kAdvanceConfig.defaultCurrency?.currencyCode ??
        'USD';

    onLoading!(true);
    isPaying = true;
    if (paymentMethodModel.paymentMethods.isNotEmpty) {
      final paymentMethod = paymentMethodModel.paymentMethods.firstWhere(
        (item) => item.id == cartModel.paymentMethod?.id,
      );

      var isSubscriptionProduct =
          cartModel.item.values.firstWhere(
            (element) =>
                element?.type == 'variable-subscription' ||
                element?.type == 'subscription',
            orElse: () => null,
          ) !=
          null;
      _cartModel.setPaymentMethod(paymentMethod);

      Analytics.triggerAddPaymentInfo(paymentMethod.title, context);

      /// Use Native payment

      /// Direct bank transfer (BACS)
      if (!isSubscriptionProduct &&
          kBankTransferConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id)) {
        onLoading?.call(false);
        isPaying = false;

        final bodyForm = Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      S.of(context).cancel,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              HtmlWidget(
                paymentMethod.description!,
                textStyle: Theme.of(context).textTheme.bodySmall,
              ),
              const Expanded(child: SizedBox(height: 10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onLoading!(true);
                  isPaying = true;
                  Services().widget.placeOrder(
                    context,
                    cartModel: cartModel,
                    onLoading: onLoading,
                    paymentMethod: paymentMethod,
                    success: (Order? order) async {
                      if (order != null) {
                        for (var item in order.lineItems) {
                          var product = cartModel.getProductById(
                            item.productId!,
                          );

                          if (product?.bookingInfo != null) {
                            product!.bookingInfo!.idOrder = order.id;
                            var booking = await createBooking(
                              product.bookingInfo,
                            )!;

                            Tools.showSnackBar(
                              ScaffoldMessenger.of(context),
                              booking ? 'Booking success!' : 'Booking error!',
                            );
                          }
                        }
                        onFinish!(order);
                      }
                      onLoading?.call(false);
                      isPaying = false;
                    },
                    error: (message) {
                      onLoading?.call(false);
                      if (message != null) {
                        Tools.showSnackBar(
                          ScaffoldMessenger.of(context),
                          message,
                        );
                      }
                      isPaying = false;
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(S.of(context).ok),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
        if (Layout.isDisplayDesktop(context)) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 500,
                height: 500,
                padding: const EdgeInsets.all(10.0),
                child: bodyForm,
              ),
            ),
          );
          return;
        }

        showModalBottomSheet(context: context, builder: (sContext) => bodyForm);

        return;
      }

      /// PayPal Payment
      final availablePaypal =
          kPaypalConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kPaypalConfig['enabled'] == true;
      if (!isSubscriptionProduct && availablePaypal) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaypalPayment(
              isExpressCheckout: false,
              onFinish: (payerID, paymentToken, paymentId) {
                if (payerID == null) {
                  onLoading?.call(false);
                  isPaying = false;
                  return;
                } else {
                  createOrder(
                    paid: true,
                    additionalPaymentInfo: AdditionalPaymentInfo(
                      ppPayerId: payerID,
                      ppPaymentToken: paymentToken,
                      ppPaymentId: paymentId,
                    ),
                  ).then((value) {
                    onLoading?.call(false);
                    isPaying = false;
                  });
                }
              },
            ),
          ),
        );
        return;
      }

      /// MercadoPago payment
      final availableMercadoPago =
          kMercadoPagoConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kMercadoPagoConfig['enabled'] == true;
      if (!isSubscriptionProduct && availableMercadoPago) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MercadoPagoPayment(
              onFinish: (number, paid) {
                if (number == null) {
                  onLoading?.call(false);
                  isPaying = false;
                  return;
                } else {
                  createOrder(paid: paid).then((value) {
                    onLoading?.call(false);
                    isPaying = false;
                  });
                }
              },
            ),
          ),
        );
        return;
      }

      /// ModemPay payment
      final availableModemPay =
          kModemPayConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kModemPayConfig['enabled'] == true;
      if (!isSubscriptionProduct && availableModemPay) {
        createOrderOnWebsite(
          paid: false,
          hideLoading: false,
          onFinish: (Order? order) async {
            if (order != null && order.id != null) {
              final orderId = order.id!;
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ModemPayPayment(
                    price: PriceTools.getPriceByRate(
                      cartModel.getPaymentTotal(),
                      currencyRate,
                      currency: currencyCode,
                    )!,
                    currency: currencyCode,
                    customerEmail: cartModel.address?.email,
                    customerPhone: cartModel.address?.phoneNumber,
                    customerName: cartModel.address?.fullName,
                    orderId: orderId,
                    onSuccess: (String transactionId) async {
                      final freshOrder = await Services().api.getOrderByOrderId(
                        orderId: orderId,
                      );
                      onLoading?.call(false);
                      isPaying = false;
                      onFinish?.call(freshOrder ?? order);
                    },
                    onError: (String? errMsg) {
                      isPaying = false;
                      onLoading?.call(false);
                      if (errMsg?.isNotEmpty ?? false) {
                        FlashHelper.errorMessage(
                          context,
                          message: errMsg ?? '',
                        );
                      }
                      unawaited(_deletePendingOrder(orderId));
                    },
                  ),
                ),
              );
            }
          },
        );
        return;
      }

      /// RazorPay payment
      /// Check below link for parameters:
      /// https://razorpay.com/docs/payment-gateway/web-integration/standard/#step-2-pass-order-id-and-other-options
      final availableRazorpay =
          kRazorpayConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kRazorpayConfig['enabled'] == true;

      if (!isSubscriptionProduct && availableRazorpay) {
        createOrderOnWebsite(
          paid: false,
          hideLoading: false,
          onFinish: (Order? order) async {
            if (order != null) {
              final price = order.total ?? 0.0;
              final razorpayServices = RazorServices(
                price: price,
                currencyCode: currencyCode.toUpperCase(),
                order: order,
                userInfo: RazorUserInfo(
                  email: cartModel.address?.email,
                  phone: cartModel.address?.phoneNumber,
                  fullName:
                      '${cartModel.address?.firstName ?? ''} ${cartModel.address?.lastName ?? ''}'
                          .trim(),
                ),
                onLoading: onLoading,
                onPaymentSuccess: (response, order) async {
                  var freshOrder;
                  if (order != null) {
                    freshOrder = await Services().api.getOrderByOrderId(
                      orderId: order.id!,
                    );
                  }
                  onLoading?.call(false);
                  isPaying = false;
                  onFinish?.call(freshOrder ?? order);
                },
                onPaymentFailure: (response) {
                  onLoading?.call(false);
                  isPaying = false;
                  var message;

                  try {
                    final body = jsonDecode(response.message!);
                    if (body is Map &&
                        body['error'] != null &&
                        body['error']['reason'] != 'payment_cancelled') {
                      message = body['error']['description'];
                    }
                  } catch (e) {
                    message = response.message;
                  }
                  if (message?.toString().isNotEmpty ?? false) {
                    if (message == 'undefined') {
                      message = S.of(context).unknownError;
                      if (response.code == 2) {
                        message = S.of(context).paymentCancelled;
                      }
                    }
                    Tools.showSnackBar(ScaffoldMessenger.of(context), message);
                  }
                },
              );
              try {
                await razorpayServices.openPayment();
              } catch (e) {
                onLoading?.call(false);
                Tools.showSnackBar(ScaffoldMessenger.of(context), e.toString());
                isPaying = false;
                unawaited(_deletePendingOrder(order.id));
              }
            }
          },
        );
        return;
      }

      /// PayTm payment.
      /// Check below link for parameters:
      /// https://developer.paytm.com/docs/all-in-one-sdk/hybrid-apps/flutter/
      final availablePayTm =
          kPayTmConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kPayTmConfig['enabled'] == true;
      if (!isSubscriptionProduct && availablePayTm) {
        createOrderOnWebsite(
          paid: false,
          onFinish: (Order? order) async {
            if (order != null && order.id != null) {
              final orderId = order.id!;
              final paytmServices = PayTmServices(
                amount: cartModel.getPaymentTotal()!.toString(),
                orderId: orderId,
                email: cartModel.address?.email,
              );
              try {
                await paytmServices.openPayment();
                final freshOrder = await Services().api.getOrderByOrderId(
                  orderId: orderId,
                );
                onFinish?.call(freshOrder ?? order);
              } catch (e) {
                Tools.showSnackBar(ScaffoldMessenger.of(context), e.toString());
                isPaying = false;
                unawaited(_deletePendingOrder(order.id));
              }
            }
          },
        );
        return;
      }

      /// PayStack payment.
      final availablePayStack =
          kPayStackConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kPayStackConfig['enabled'] == true;
      if (!isSubscriptionProduct && availablePayStack) {
        final isSupported =
            List.from(
              kPayStackConfig['supportedCurrencies'] ?? [],
            ).firstWhereOrNull(
              (e) => e.toString().toLowerCase() == currencyCode.toLowerCase(),
            ) !=
            null;
        if (isSupported) {
          createOrderOnWebsite(
            paid: false,
            onFinish: (Order? order) async {
              if (order != null) {
                final payStackServices = PayStackServices(
                  amount: order.total?.toString() ?? '',
                  orderId: order.id!,
                  email: cartModel.address?.email,
                );
                try {
                  await payStackServices.openPayment(context, onLoading!);
                  final freshOrder = await Services().api.getOrderByOrderId(
                    orderId: order.id!,
                  );
                  onFinish?.call(freshOrder ?? order);
                } catch (e) {
                  Tools.showSnackBar(
                    ScaffoldMessenger.of(context),
                    e.toString(),
                  );
                  isPaying = false;
                  unawaited(_deletePendingOrder(order.id));
                }
              }
            },
          );
        } else {
          isPaying = false;
          onLoading?.call(false);
          Tools.showSnackBar(
            ScaffoldMessenger.of(context),
            S.of(context).currencyIsNotSupported(currencyCode.toUpperCase()),
          );
        }
        return;
      }

      /// Flutterwave payment.
      final availableFlutterwave =
          kFlutterwaveConfig
              .getValueList('paymentMethodIds')
              .contains(paymentMethod.id) &&
          kFlutterwaveConfig['enabled'] == true;
      if (!isSubscriptionProduct && availableFlutterwave) {
        createOrderOnWebsite(
          paid: false,
          onFinish: (Order? order) async {
            if (order != null) {
              final flutterwaveServices = FlutterwaveServices(
                amount: PriceTools.getPriceValueByCurrency(
                  cartModel.getPaymentTotal() ?? 0.0,
                  currencyCode,
                  currencyRate,
                ).toString(),
                orderId: order.id!,
                email: cartModel.address?.email,
                name: cartModel.address?.fullName,
                phone: cartModel.address?.phoneNumber,
                currency: currencyCode,
                paymentMethod: paymentMethod.title,
              );
              try {
                await flutterwaveServices.openPayment(context, onLoading!);
                final freshOrder = await Services().api.getOrderByOrderId(
                  orderId: order.id!,
                );
                onFinish?.call(freshOrder ?? order);
              } catch (e) {
                Tools.showSnackBar(ScaffoldMessenger.of(context), e.toString());
                isPaying = false;
                unawaited(_deletePendingOrder(order.id));
              }
            }
          },
        );
        return;
      }

      /// PhonePe payment.
      final availablePhonePe =
          kPhonePeConfig
              .getValueList<String>('paymentMethodIds')
              .anyTheSame(paymentMethod.id) &&
          (kPhonePeConfig['enabled'] ?? false);

      if (!isSubscriptionProduct && availablePhonePe) {
        createOrderOnWebsite(
          paid: false,
          hideLoading: false,
          onFinish: (Order? order) async {
            if (order != null && order.id != null) {
              final orderId = order.id!;
              PhonePeServices(
                amount: order.total ?? 0,
                orderId: orderId,
                user: cartModel.user,
                onSuccess: () async {
                  final freshOrder = await Services().api.getOrderByOrderId(
                    orderId: orderId,
                  );
                  onLoading?.call(false);
                  isPaying = false;
                  onFinish?.call(freshOrder ?? order);
                },
                onFail: (e) {
                  if (e.isNotEmpty) {
                    Tools.showSnackBar(
                      ScaffoldMessenger.of(context),
                      e.toString(),
                    );
                  }
                  isPaying = false;
                  onLoading?.call(false);
                  unawaited(_deletePendingOrder(orderId));
                },
                onCancel: () {
                  isPaying = false;
                  onLoading?.call(false);
                  unawaited(_deletePendingOrder(orderId));
                },
              ).openPayment(context);
            }
          },
        );
        return;
      }

      /// Use WebView Payment per frameworks
      Services().widget.placeOrder(
        context,
        cartModel: cartModel,
        onLoading: onLoading,
        paymentMethod: paymentMethod,
        success: (Order? order) async {
          var booking = false;
          if (order != null) {
            // for (var item in order.lineItems) {
            // var product = cartModel.getProductById(item.productId!);
            for (var key in cartModel.productsInCart.keys) {
              var productBooking =
                  cartModel.cartItemMetaDataInCart[key]?.bookingInfo;
              if (productBooking != null) {
                productBooking.idOrder = order.id;
                booking = await createBooking(productBooking)!;
                Tools.showSnackBar(
                  ScaffoldMessenger.of(context),
                  booking ? 'Booking success!' : 'Booking error!',
                );
              }
              // }
            }
            onFinish!(order);
          }
          onLoading?.call(false);
          isPaying = false;
        },
        error: (message) {
          onLoading?.call(false);
          if (message != null) {
            Tools.showSnackBar(ScaffoldMessenger.of(context), message);
          }

          isPaying = false;
        },
      );
    }
  }
}
