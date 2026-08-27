import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools.dart';
import '../../../models/cart/cart_base.dart';
import '../../../models/cart/cart_item_meta_data.dart';
import '../../../models/index.dart' show AppModel, Product;
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../services/index.dart';
import '../action_button_mixin.dart';
import 'cart_item_state_ui.dart';
import 'layouts/cart_item_normal_widget.dart';
import 'layouts/cart_item_short_type_widget.dart';
import 'layouts/cart_item_style01_widget.dart';
import 'layouts/cart_item_web_widget.dart';

class ShoppingCartRow extends StatelessWidget with ActionButtonMixin {
  const ShoppingCartRow({
    required this.product,
    required this.quantity,
    this.cartKey,
    this.onRemove,
    this.onChangeQuantity,
    this.cartItemMetaData,
    this.enableTopDivider,
    this.enableBottomDivider = true,
    this.showStoreName = true,
    this.enabledTextBoxQuantity = true,
    this.cartStyle = CartStyle.normal,
  });

  final bool? enableTopDivider;
  final bool enableBottomDivider;
  final bool enabledTextBoxQuantity;
  final Product? product;
  final CartItemMetaData? cartItemMetaData;
  final int? quantity;

  /// Le Voile: this row's key in [CartModel.productsInCart]
  /// (`productId-variationId`).
  ///
  /// The row already knows its product and variation, but the discount split
  /// is keyed by the cart key, and rebuilding that key here from the two
  /// halves would be a second, drifting copy of a format the model owns.
  /// Callers that have the key pass it; the ones that do not simply get no
  /// discount line, which is the old behaviour.
  final String? cartKey;
  final bool Function(int value)? onChangeQuantity;
  final VoidCallback? onRemove;
  final bool showStoreName;
  final CartStyle cartStyle;

  void _onRemoveItem(BuildContext context) async {
    final confirmed = await context.showFluxBottomSheetActionText(
      title: S.of(context).notice,
      body: S.of(context).confirmRemoveProductInCart,
      primaryAction: S.of(context).remove,
      secondaryAction: S.of(context).keep,
      directionButton: Axis.vertical,
      primaryAsDestructiveAction: true,
    );

    if (confirmed) {
      onRemove?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    var currency = Provider.of<AppModel>(context).currency;
    final currencyRate = Provider.of<AppModel>(context).currencyRate;

    /// Using Consumer instead of Selector to ensure rebuild when product updates.
    ///
    /// Why Consumer is needed:
    /// Product class implements == operator based on id and name only:
    ///   bool operator ==(Object other) =>
    ///       identical(this, other) ||
    ///       other is Product &&
    ///           runtimeType == other.runtimeType &&
    ///           id == other.id &&
    ///           name == other.name;
    ///
    /// When updateProduct() is called with a new Product instance that has the same
    /// id and name but different other properties (bookingInfo, price, etc),
    /// Selector would compare them as equal and skip rebuild.
    ///
    /// Consumer always rebuilds when CartModel.notifyListeners() is called,
    /// regardless of Product equality, ensuring UI always reflects the latest
    /// product data from the cart model.
    return Consumer<CartModel>(
      builder: (context, cartModel, __) {
        final product = cartModel.item[this.product?.id];
        if (product == null) {
          return const SizedBox();
        }

        final price = Services().widget.getPriceItemInCart(
          product,
          cartItemMetaData,
          currencyRate,
          currency,
        );
        final imageFeature =
            (cartItemMetaData?.variation?.imageFeature?.isNotEmpty ?? false)
            ? cartItemMetaData?.variation!.imageFeature
            : product.imageFeature;

        final maxAllowQuantity =
            Helper.formatInt(kCartDetail['maxAllowQuantity']) ?? 100;
        var totalQuantity = cartItemMetaData?.variation != null
            ? (cartItemMetaData?.variation!.stockQuantity ?? maxAllowQuantity)
            : (product.stockQuantity ?? maxAllowQuantity);
        var limitQuantity = totalQuantity > maxAllowQuantity
            ? maxAllowQuantity
            : totalQuantity;
        final inStock =
            (cartItemMetaData?.variation != null
                ? cartItemMetaData?.variation!.inStock
                : product.inStock) ??
            false;
        final isOnBackorder = cartItemMetaData?.variation != null
            ? cartItemMetaData?.variation?.backordersAllowed ?? false
            : product.backordersAllowed;
        final priceWithQuantity = Services().widget.getPriceItemInCart(
          product,
          cartItemMetaData,
          currencyRate,
          currency,
          quantity: quantity ?? 1,
        );

        // Le Voile: this row's share of the discount, so the customer can see
        // WHICH piece the coupon came off, how much came off it, and what the
        // piece costs now — the cart total alone only ever told them that some
        // money came off somewhere.
        //
        // The before AND after prices both come from the model's own numbers
        // rather than one from here and one from `price` above, so that what
        // the customer reads always subtracts correctly: a struck-out price
        // that does not minus the stated discount into the new price is worse
        // than showing no breakdown at all.
        final discount = cartKey == null
            ? null
            : cartModel.discountPerCartItem[cartKey];
        String? formatMoney(double value) =>
            PriceTools.getCurrencyFormatted(value, currencyRate,
                currency: currency);
        final units = (quantity ?? 1) > 0 ? (quantity ?? 1) : 1;
        final discountAmount =
            discount == null ? null : formatMoney(discount.amount);
        final priceBeforeDiscount =
            discount == null ? null : formatMoney(discount.subtotal / units);
        final priceAfterDiscount =
            discount == null ? null : formatMoney(discount.total / units);

        // Le Voile: the piece's OWN reduction, which is not a cart discount at
        // all — `discountPerCartItem` only ever carries what a coupon or an
        // automatic cart rule took off. A product the merchant marked down
        // arrives here already at its sale price, so the cart showed one plain
        // number and the saving the customer was shopping for vanished at the
        // last screen before paying.
        //
        // Shown ONLY when no cart discount landed on the row. With both, the
        // row would carry three prices and the customer would have to work out
        // which two of them subtract — and the coupon breakdown above is
        // already correct, because Shopify's line subtotal is the SALE price.
        // 🔴 `onSale` is deliberately NOT consulted, and the reason is a trap:
        // `ProductVariation.toJson()` writes the key `on_sale` while
        // `fromLocalJson()` reads `onSale`, so the flag comes back FALSE for
        // every row restored from local storage. That path runs on every cold
        // launch for a guest — most of this app's carts — so gating on it made
        // the strike-through appear when the piece was added and quietly
        // disappear the next time the app was opened.
        //
        // Comparing the two prices is the same test anyway: Shopify's mapping
        // is `regularPrice = isOnSale ? compareAtPrice : price`, so a
        // regularPrice ABOVE the selling price only ever means "on sale". It
        // also guards bad catalogue data — a compare-at at or below the
        // selling price would print a struck-out number the customer can only
        // read as the shop pricing itself wrong.
        final saleVariation = cartItemMetaData?.variation;
        final wasPrice = double.tryParse(
          (saleVariation != null
                  ? saleVariation.regularPrice
                  : product.regularPrice) ??
              '',
        );
        final nowPrice = double.tryParse(
          (saleVariation != null ? saleVariation.price : product.price) ?? '',
        );
        final priceBeforeSale =
            discount == null &&
                wasPrice != null &&
                nowPrice != null &&
                wasPrice > nowPrice
            ? formatMoney(wasPrice)
            : null;

        final stateUI = CartItemStateUI(
          enableBottomDivider: enableBottomDivider,
          inStock: inStock,
          isOnBackorder: isOnBackorder,
          onTapProduct: onTapProduct,
          product: product,
          showStoreName: showStoreName,
          cartItemMetaData: cartItemMetaData,
          enableTopDivider: enableTopDivider,
          imageFeature: imageFeature,
          limitQuantity: limitQuantity,
          enabledTextBoxQuantity: enabledTextBoxQuantity,
          onChangeQuantity: onChangeQuantity,
          onRemove: onRemove != null ? () => _onRemoveItem(context) : null,
          price: price,
          priceWithQuantity: priceWithQuantity,
          priceBeforeDiscount: priceBeforeDiscount,
          priceAfterDiscount: priceAfterDiscount,
          discountAmount: discountAmount,
          discountLabel: discount?.label,
          priceBeforeSale: priceBeforeSale,
          quantity: quantity,
        );

        // Because this case does not need to
        // use LayoutBuilder, so separate it and use if
        if (cartStyle.isWeb) {
          return CartItemWebWidget(stateUI);
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            switch (cartStyle) {
              case CartStyle.short:
                return CartItemShortTypeWidget(
                  stateUI,
                  constraintsCurrent: constraints,
                );
              case CartStyle.style01:
                return CartItemStyle01Widget(
                  stateUI,
                  constraintsCurrent: constraints,
                );
              case CartStyle.normal:
              default:
                return CartItemNormalWidget(
                  stateUI,
                  heightImageFeature: constraints.maxWidth * 0.3,
                  widthImageFeature: constraints.maxWidth * 0.25,
                );
            }
          },
        );
      },
    );
  }
}
