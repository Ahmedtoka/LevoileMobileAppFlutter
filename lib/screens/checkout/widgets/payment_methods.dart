import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools.dart';
import '../../../models/index.dart'
    show AppModel, CartModel, Order, PaymentMethodModel, TaxModel, FeeModel;
import '../../../models/tera_wallet/index.dart';
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../services/index.dart';
import '../../cart/widgets/shopping_cart_sumary.dart';
import '../mixins/payment_mixin.dart';
import 'checkout_action.dart';

class PaymentMethods extends StatefulWidget {
  final Function? onBack;
  final Function(Order)? onFinish;
  final Function(bool)? onLoading;
  final bool hideCheckout;

  const PaymentMethods({
    this.onBack,
    this.onFinish,
    this.onLoading,
    this.hideCheckout = false,
  });

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> with PaymentMixin {
  @override
  Function? get onBack => widget.onBack;

  @override
  Function(Order)? get onFinish => widget.onFinish;

  @override
  Function(bool)? get onLoading => widget.onLoading;

  bool _autoSelectScheduled = false;

  void _applyPaymentSelection({
    required String? id,
    required CartModel cartModel,
    required PaymentMethodModel paymentMethodModel,
  }) {
    if (!mounted) return;
    setState(() {
      selectedId = id;
    });
    final paymentMethod = paymentMethodModel.paymentMethods.firstWhereOrNull(
      (item) => item.id == id,
    );
    cartModel.setPaymentMethod(paymentMethod);
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    final currencyRate = Provider.of<AppModel>(context).currencyRate;
    final currencyCode = cartModel.currencyCode;
    final paymentMethodModel = Provider.of<PaymentMethodModel>(context);
    final taxModel = Provider.of<TaxModel>(context);
    final feeModel = Provider.of<FeeModel>(context);
    final useDesktopLayout = Layout.isDisplayDesktop(context);

    var cartTotal = cartModel.getTotal();

    //if Risk Free Cod is checked, the total should be calculated by server, it will be included extra fee that settings on the website.
    if ((cartModel.wooSmartCod?.userAdvanceAmount ?? 0) > 0) {
      final cod = paymentMethodModel.paymentMethods.firstWhereOrNull(
        (e) => e.smartCod != null,
      );
      cartTotal = cod?.smartCod?.realTotal ?? cartTotal;
    }

    // E de tam function trong function
    void onChangePaymentMethod(String? id) {
      if (selectedId == id) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyPaymentSelection(
          id: id,
          cartModel: cartModel,
          paymentMethodModel: paymentMethodModel,
        );
      });
    }

    // Used only for automatic default-selection inside the builder.
    // Guards against multiple callbacks being stacked across rebuilds that
    // happen before the first callback fires (e.g. while isLoading flips).
    // Cannot reuse onChangePaymentMethod here: if the user taps A then B
    // quickly, the flag would block B while A's callback is still pending.
    void scheduleAutoSelect(String? id) {
      if (selectedId == id) return;
      if (_autoSelectScheduled) return;
      _autoSelectScheduled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoSelectScheduled = false;
        _applyPaymentSelection(
          id: id,
          cartModel: cartModel,
          paymentMethodModel: paymentMethodModel,
        );
      });
    }

    final body = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).paymentMethods,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              S.of(context).chooseYourPaymentMethod,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(
                  context,
                ).colorScheme.secondary.withValueOpacity(0.6),
              ),
            ),
            Services().widget.renderPayByWallet(context),
            const SizedBox(height: 20),
            Consumer2<PaymentMethodModel, WalletModel>(
              builder: (context, model, walletModel, child) {
                if (model.isLoading) {
                  return SizedBox(height: 100, child: kLoadingWidget(context));
                }

                if (model.message != null) {
                  return SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        model.message!,
                        style: const TextStyle(color: kErrorRed),
                      ),
                    ),
                  );
                }

                var paymentMethods = model.paymentMethods;
                if (cartModel.wooSmartCod?.isRiskFreeEnabled == true &&
                    (cartModel
                            .wooSmartCod
                            ?.disallowedPaymentGateways
                            ?.isNotEmpty ??
                        false)) {
                  paymentMethods = paymentMethods
                      .where(
                        (e) =>
                            !(cartModel.wooSmartCod?.disallowedPaymentGateways
                                    ?.contains(e.id ?? '') ??
                                false),
                      )
                      .toList();

                  if (cartModel.wooSmartCod?.disallowedPaymentGateways
                          ?.contains(selectedId ?? '') ??
                      true) {
                    final newSelectedId = paymentMethods.firstWhereOrNull((
                      item,
                    ) {
                      return item.id != 'cod' && item.enabled!;
                    })?.id;
                    scheduleAutoSelect(newSelectedId);
                  }
                }

                if (paymentMethods.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/leaves.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  );
                }

                var ignoreWallet = false;
                final isWalletExisted =
                    paymentMethods.firstWhereOrNull((e) => e.id == 'wallet') !=
                    null;
                if (isWalletExisted) {
                  final total =
                      (cartModel.getTotal() ?? 0) + cartModel.walletAmount;
                  ignoreWallet = total > walletModel.balance;
                }

                if (selectedId == null && paymentMethods.isNotEmpty) {
                  final newSelectedId = paymentMethods.firstWhereOrNull((item) {
                    if (ignoreWallet) {
                      return item.id != 'wallet' && item.enabled!;
                    } else {
                      return item.enabled!;
                    }
                  })?.id;
                  scheduleAutoSelect(newSelectedId);
                }

                return RadioGroup<String?>(
                  groupValue: selectedId,
                  onChanged: onChangePaymentMethod,
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < paymentMethods.length; i++)
                        if (paymentMethods[i].enabled ?? false)
                          Services().widget.renderPaymentMethodItem(
                            context,
                            paymentMethods[i],
                            onChangePaymentMethod,
                            selectedId,
                            useDesktopStyle: useDesktopLayout,
                          ),
                    ],
                  ),
                );
              },
            ),
            if (widget.hideCheckout == false) ...[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: ShoppingCartSummary(showPrice: false),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).subtotal,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withValueOpacity(0.8),
                      ),
                    ),
                    Text(
                      PriceTools.getCurrencyFormatted(
                        cartModel.getSubTotal(),
                        currencyRate,
                        currency: currencyCode,
                      )!,
                      style: const TextStyle(fontSize: 14, color: kGrey400),
                    ),
                  ],
                ),
              ),
              Services().widget.renderShippingMethodInfo(context),
              _CouponInfo(coupon: cartModel.getCoupon()),
              Services().widget.renderTaxes(taxModel, context),
              Services().widget.renderRewardInfo(context),
              Services().widget.renderLoyaltyCouponInfo(context),
              Services().widget.renderCheckoutWalletInfo(context),
              Services().widget.renderCODExtraFee(context),
              Services().widget.renderFees(feeModel, context),
              Services().renderSmartCodCheckoutExtraFeeInfo(context),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).total,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      PriceTools.getCurrencyFormatted(
                        cartTotal,
                        currencyRate,
                        currency: currencyCode,
                      )!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Services().renderSmartCodCheckoutRiskFreeInfo(context),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );

    return ListenableProvider.value(
      value: paymentMethodModel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (useDesktopLayout)
            Padding(padding: const EdgeInsets.only(bottom: 50), child: body)
          else
            Expanded(child: body),
          Consumer<PaymentMethodModel>(
            builder: (context, paymentMethodModel, child) {
              return CheckoutActionWidget(
                iconPrimary: CupertinoIcons.check_mark_circled_solid,
                labelPrimary: S.of(context).placeMyOrder,
                onTapPrimary:
                    (paymentMethodModel.message?.isNotEmpty ?? false) ||
                        selectedId == null
                    ? null
                    : () => isPaying
                          ? showSnackbar()
                          : placeOrder(paymentMethodModel, cartModel),
                labelSecondary: kPaymentConfig.enablePreview
                    ? S.of(context).goBack.toUpperCase()
                    : kPaymentConfig.enableShipping
                    ? S.of(context).goBackToShipping
                    : S.of(context).goBackToAddress,
                onTapSecondary: () {
                  isPaying ? showSnackbar() : widget.onBack?.call();
                },
                showSecondary:
                    kPaymentConfig.enableShipping ||
                    kPaymentConfig.enableAddress ||
                    kPaymentConfig.enablePreview,
                showPrimary: widget.hideCheckout == false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CouponInfo extends StatelessWidget {
  final String coupon;

  const _CouponInfo({required this.coupon});

  @override
  Widget build(BuildContext context) {
    if (coupon.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).discount,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text(
            coupon,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
