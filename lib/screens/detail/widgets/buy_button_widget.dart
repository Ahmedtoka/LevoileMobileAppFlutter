import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../frameworks/frameworks.dart';
import '../../../models/entities/index.dart';
import '../../../models/product_model.dart';
import '../../../models/product_variant_model.dart';
import '../../../services/service_config.dart';
import '../../../services/services.dart';
import '../../../widgets/product/lv_purchase_limit.dart';

class BuyButtonWidget extends StatelessWidget {
  const BuyButtonWidget({
    super.key,
    this.showQuantity = true,
    this.product,
    this.builderQuantitySelection,
  });

  final bool showQuantity;
  final Product? product;
  final Widget Function(bool Function(int) onChanged, int maxQuantity)?
  builderQuantitySelection;

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProductVariantModel>(context);
    var productVariation = model.productVariation;
    var productCurrent = product ?? model.product ?? Product();
    var mapAttribute = model.mapAttribute;
    var quantity = model.quantity;
    var variations = context.select(
      (ProductModel productModel) => productModel.variations,
    );
    var isInAppPurchaseChecking = model.isInAppPurchaseChecking;
    final rentalRequired =
        kAdvanceConfig.enableRentalProductsWoo &&
        productCurrent.rentalDateSelectionRequired;
    final rentalInfo = model.rentalInfo;
    final disableBuyButtonForRental = rentalRequired && rentalInfo == null;

    final disabled = Services().hideProductPrice(context, product);
    if (disabled) {
      return Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _addToCart(context, true, true);
            },
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Theme.of(context).primaryColor,
              ),
              child: Center(
                child: Text(
                  S.of(context).addToQuoteRequest.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).primaryColor.getColorBasedOnBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      children: Services().widget.getBuyButtonWidget(
        context: context,
        productVariation: productVariation,
        product: productCurrent,
        mapAttribute: mapAttribute,
        maxQuantity: _getMaxQuantity(productCurrent, productVariation),
        quantity: quantity,
        addToCart: ({bool buyNow = false, bool inStock = false}) {
          _addToCart(context, buyNow, inStock);
        },
        onChangeQuantity: (int val) {
          model.updateValues(quantity: val);
        },
        variations: variations,
        isInAppPurchaseChecking: isInAppPurchaseChecking,
        showQuantity: showQuantity,
        builderQuantitySelection: builderQuantitySelection,
        disableBuyButton: disableBuyButtonForRental,
      ),
    );
  }

  /// check limit select quality by maximum available stock
  ///
  /// Le Voile: this logic moved to [LvPurchaseLimit] so the product page, the
  /// cart row and add-to-cart cannot answer the same question differently —
  /// they used to, and the disagreement is what let a customer fill a basket
  /// they could not check out. One behaviour change on the way past: the stock
  /// check used to be skipped whenever the PRODUCT allowed backorders, which
  /// on Shopify is set per VARIANT, so one "continue selling" size lifted the
  /// limit off every other size too.
  int _getMaxQuantity(Product product, ProductVariation? productVariation) =>
      LvPurchaseLimit.forSelector(
        variation: productVariation,
        product: product,
      );

  /// Add to Cart & Buy Now function
  void _addToCart(
    BuildContext context, [
    bool buyNow = false,
    bool inStock = false,
  ]) {
    var model = Provider.of<ProductVariantModel>(context, listen: false);
    var productVariation = model.productVariation;
    var product = model.product ?? Product();
    var mapAttribute = model.mapAttribute;
    var quantity = model.quantity;
    var selectedComponents = model.selectedComponents;
    var selectedTiredPrice = model.selectedTiredPrice;
    var tiredPrices = model.tiredPrices;
    var pwGiftCardInfo = model.pwGiftCardInfo;
    var selectedYithOptions = model.selectedYithOptions;
    var rentalInfo = model.rentalInfo;

    if (buyNow &&
        Services().widget.enableInAppPurchase &&
        !ServerConfig().isBuilder) {
      Services().doIAPPayment(
        context,
        product,
        productVariation,
        quantity,
        mapAttribute ?? {},
        (bool isLoading) {
          model.updateValues(isInAppPurchaseChecking: isLoading);
        },
        () {
          Services().widget.addToCart(
            context,
            product,
            quantity,
            AddToCartArgs(
              productVariation: productVariation,
              mapAttribute: mapAttribute ?? {},
              selectedComponents: selectedComponents,
              selectedTiredPrice: selectedTiredPrice,
              tiredPrices: tiredPrices,
              pwGiftCardInfo: pwGiftCardInfo,
              selectedYithOptions: selectedYithOptions,
              rentalInfo: rentalInfo,
            ),
            buyNow,
            inStock,
          );
        },
      );
    } else {
      Services().widget.addToCart(
        context,
        product,
        quantity,
        AddToCartArgs(
          productVariation: productVariation,
          mapAttribute: mapAttribute ?? {},
          selectedComponents: selectedComponents,
          selectedTiredPrice: selectedTiredPrice,
          tiredPrices: tiredPrices,
          pwGiftCardInfo: pwGiftCardInfo,
          selectedYithOptions: selectedYithOptions,
          rentalInfo: rentalInfo,
        ),
        buyNow,
        inStock,
      );
    }
  }
}
