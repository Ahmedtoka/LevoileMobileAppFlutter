import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/tools/biometrics_tools.dart';
import '../../../common/tools/flash.dart';
import '../../../common/tools/navigate_tools.dart';
import '../../../common/tools/price_tools.dart';
import '../../../menu/maintab_delegate.dart';
import '../../../models/index.dart';
import '../../../routes/flux_navigate.dart';
import '../../../services/service_config.dart';
import '../../../services/services.dart';
import '../../../widgets/product/product_bottom_sheet.dart';
import '../../checkout/checkout_screen.dart';

mixin MyCartMixin<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  String errMsg = '';
  bool _isRefreshingCartProducts = false;

  bool? get isModal;

  CartModel get cartModel => Provider.of<CartModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      refreshCartProducts(cartModel);
    });
  }

  /// Refreshes product data in the cart from the server.
  /// Uses a guard flag to prevent concurrent/repeated calls.
  ///
  /// Simple products can be fetched in a single batch API call using
  /// [fetchProductsByCategory] with the `include` parameter.
  /// Variation products are fetched individually since each requires
  /// its own productId + variationId pair.
  Future<void> refreshCartProducts(CartModel model) async {
    if (_isRefreshingCartProducts || model.isWalletCart()) return;

    _isRefreshingCartProducts = true;
    try {
      final allKeys = model.productsInCart.keys.toList();

      // Separate variation keys from simple product keys.
      final variationKeys = <String>[];
      final simpleKeys = <String>[];
      for (final key in allKeys) {
        final isVariation =
            model.cartItemMetaDataInCart[key]?.variation != null;
        if (isVariation) {
          variationKeys.add(key);
        } else {
          simpleKeys.add(key);
        }
      }

      // Batch-fetch simple products in chunks to respect WooCommerce per_page limit.
      if (simpleKeys.isNotEmpty && ServerConfig().isWooPluginSupported) {
        final productIds = simpleKeys
            .map((key) => Product.cleanProductID(key))
            .toSet()
            .toList();

        // WooCommerce max per_page is typically 100, using 25 for better performance
        const chunkSize = 25;
        for (var i = 0; i < productIds.length; i += chunkSize) {
          try {
            final chunk = productIds.sublist(
              i,
              (i + chunkSize).clamp(0, productIds.length),
            );
            final include = chunk.join(',');

            final products =
                await Services().api.fetchProductsByCategory(
                  include: include,
                  page: 1,
                  limit: chunk.length,
                  // Fetch product from main server instead of search engine to ensure latest data
                  boostEngine: false,
                  // Fetch product without cache to ensure latest data
                  refreshCache: true,
                ) ??
                [];
            for (final product in products) {
              model.updateProduct(product.id, product);
              simpleKeys.removeWhere(
                (key) => Product.cleanProductID(key) == product.id,
              );
            }
          } catch (_) {}
        }
      }

      // For any remaining simple product keys (e.g. non-WooCommerce or
      // products not returned in batch), fetch individually with limited
      // concurrency to avoid spiking the server.
      const concurrencyLimit = 5;
      for (final chunk in simpleKeys.slices(concurrencyLimit)) {
        await Future.wait(
          chunk.map((key) async {
            try {
              final productId = Product.cleanProductID(key);
              // Try to load product instead of listing because the cart cannot
              // add listing products
              final updatedProduct = await Services().api.overrideGetProduct(
                productId,
              );

              // Remove invalid products that cannot be loaded. This can happen
              // if a product was deleted from the server after being added to
              // the cart.
              if (updatedProduct?.isEmptyProduct() ?? true) {
                model.removeItemFromCart(key);
                return;
              }

              model.updateProduct(productId, updatedProduct);
            } catch (_) {
              // Ignore error to ensure the cart screen is always shown even if
              // some products fail to load
            }
          }),
        );
      }

      // Fetch variation products with limited concurrency.
      for (final chunk in variationKeys.slices(concurrencyLimit)) {
        await Future.wait(
          chunk.map((key) async {
            try {
              final productId = Product.cleanProductID(key);
              final productVariation = model.getProductVariationById(key);
              final updatedVariation = await Services().api.getVariationProduct(
                productId,
                productVariation?.id,
              );

              // Remove invalid variations that cannot be loaded. This can
              // happen if a variation was deleted from the server after being
              // added to the cart.
              if (updatedVariation == null) {
                model.removeItemFromCart(key);
                return;
              }

              model.updateProductVariant(key, updatedVariation);
            } catch (_) {
              // Ignore error to ensure the cart screen is always shown even if
              // some products fail to load
            }
          }),
        );
      }

      model.updateStateCheckoutButton();
    } finally {
      _isRefreshingCartProducts = false;
    }
  }

  void _loginWithResult(BuildContext context) async {
    await NavigateTools.navigateToLogin(context);

    final user = Provider.of<UserModel>(context, listen: false).user;
    if (user != null && user.name != null) {
      Tools.showSnackBar(
        ScaffoldMessenger.of(context),
        '${S.of(context).welcome} ${user.name} !',
      );
      setState(() {});
    }
  }

  Future<void> clearCartPopup(BuildContext context) async {
    final confirmed = await context.showFluxDialogText(
      title: S.of(context).notice,
      body: S.of(context).confirmClearTheCart,
      primaryAction: S.of(context).clear,
      secondaryAction: S.of(context).keep,
      primaryAsDestructiveAction: true,
      directionButton: Axis.vertical,
    );
    if (confirmed) {
      await cartModel.clearCart();
    }
  }

  Future<void> onCheckout(CartModel model) async {
    var isLoggedIn = Provider.of<UserModel>(context, listen: false).loggedIn;
    final appModel = Provider.of<AppModel>(context, listen: false);
    final currencyRate = appModel.currencyRate;
    final currency = appModel.currency;

    var message;

    if (isLoading) return;

    showLoading();

    // Force refresh all product data before checkout to ensure
    // latest stock/price information.
    await refreshCartProducts(model);

    if (model.enableCheckoutButton == false) {
      message = S.of(context).pleaseAdjustYourCart;
    }

    hideLoading('');

    // Check global minimum cart value
    if (kCartDetail['minAllowTotalCartValue'] != null) {
      if (kCartDetail['minAllowTotalCartValue'].toString().isNotEmpty) {
        var totalValue = model.getSubTotal() ?? 0;
        var minValue = PriceTools.getCurrencyFormatted(
          kCartDetail['minAllowTotalCartValue'],
          currencyRate,
          currency: currency,
        );
        if (totalValue < kCartDetail['minAllowTotalCartValue'] &&
            model.totalCartQuantity > 0) {
          message = '${S.of(context).totalCartValue} $minValue';
        }
      }
    }

    // Check multi vendor
    if (kVendorConfig.disableMultiVendorCheckout &&
        ServerConfig().isVendorType() &&
        message == null) {
      if (!model.isDisableMultiVendorCheckoutValid(
        model.productsInCart,
        model.getProductById,
      )) {
        message = S.of(context).youCanOnlyOrderSingleStore;
      }
    }

    // Check vendor-specific minimum order amounts
    if (message == null && ServerConfig().isVendorType()) {
      var (minOrderAmount, storeName) = model.getVendorWiseCartTotal();
      final minValue = PriceTools.getCurrencyFormatted(
        minOrderAmount,
        currencyRate,
        currency: currency,
      );
      if (minValue != null && storeName != null) {
        message = S.of(context).minOrderAmount(storeName, minValue);
      }
    }

    if (message != null) {
      unawaited(FlashHelper.errorMessage(context, message: message));
      return;
    }

    if (model.totalCartQuantity == 0) {
      if (isModal == true) {
        try {
          ExpandingBottomSheet.of(context)!.close();
        } catch (e) {
          unawaited(Navigator.of(context).pushNamed(RouteList.dashboard));
        }
      } else {
        final modalRoute = ModalRoute.of(context);
        if (modalRoute?.canPop ?? false) {
          Navigator.of(context).pop();
        }

        MainTabControlDelegate.getInstance().changeToDefaultTab();
      }
    } else if (isLoggedIn || kPaymentConfig.guestCheckout) {
      doCheckout();
    } else {
      _loginWithResult(context);
    }
  }

  void doCheckout() async {
    if (BiometricsTools.instance.isCheckoutSupported) {
      var didAuth = await BiometricsTools.instance.localAuth(context);
      if (!didAuth) {
        return;
      }
    }
    showLoading();

    await Services().widget.doCheckout(
      context,
      success: () async {
        hideLoading('');

        if (ServerConfig().isHaravan) {
          return FluxNavigate.pushNamed(
            RouteList.checkoutWithWebview,
            context: context,
            forceRootNavigator: true,
          ).then((value) => NavigateTools.redirect(context, value));
        }

        var manualClosed = await FluxNavigate.pushNamed(
          RouteList.checkout,
          arguments: CheckoutArgument(isModal: isModal),
          forceRootNavigator: true,
          context: context,
        );

        if (true == manualClosed) {
          if (isModal == true) {
            try {
              ExpandingBottomSheet.of(context)!.close();
            } catch (e) {
              if (ModalRoute.of(context)?.canPop ?? false) {
                Navigator.of(context).pop();
              } else {
                await Navigator.of(context).pushNamed(RouteList.dashboard);
              }
            }
          } else if (ModalRoute.of(context)?.canPop ?? false) {
            Navigator.of(context).pop();
          }
        }
      },
      error: (message) async {
        if (message ==
            Exception(
              'Token expired. Please logout then login again',
            ).toString()) {
          setState(() {
            isLoading = false;
          });
          //logout
          final userModel = Provider.of<UserModel>(context, listen: false);
          await userModel.logout();
          await Services().firebase.signOut();

          _loginWithResult(context);
        } else {
          hideLoading(message);
          Future.delayed(const Duration(seconds: 3), () {
            setState(() => errMsg = '');
          });
        }
      },
      loading: (isLoading) {
        setState(() {
          this.isLoading = isLoading;
        });
      },
    );
  }

  void showLoading() {
    setState(() {
      isLoading = true;
      errMsg = '';
    });
  }

  void hideLoading(error) {
    setState(() {
      isLoading = false;
      errMsg = error;
    });
  }

  void onPressedClose(String layoutType, bool? isBuyNow) {
    if (isBuyNow!) {
      Navigator.of(context).pop();
      return;
    }

    if (Navigator.of(context).canPop() &&
        ['simpleType', 'flatStyle'].contains(layoutType) == false) {
      Navigator.of(context).pop();
    } else {
      ExpandingBottomSheet.of(context, isNullOk: true)?.close();
    }
  }
}
