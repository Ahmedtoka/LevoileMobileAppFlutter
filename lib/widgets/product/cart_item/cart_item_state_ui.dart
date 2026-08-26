import 'package:flutter/material.dart';

import '../../../models/cart/cart_item_meta_data.dart';
import '../../../models/index.dart';
import '../../../services/services.dart';

enum CartStyle {
  normal,
  style01,

  /// For PWA only
  web,

  /// For PWA only
  short;

  bool get isNormal => this == CartStyle.normal;
  bool get isStyle01 => this == CartStyle.style01;
  bool get isWeb => this == CartStyle.web;
  bool get isShort => this == CartStyle.short;
}

class CartItemStateUI {
  final bool? enableTopDivider;
  final bool enableBottomDivider;
  final Product product;
  final CartItemMetaData? cartItemMetaData;
  final int? quantity;

  final bool Function(int value)? onChangeQuantity;
  final VoidCallback? onRemove;
  final bool showStoreName;
  final bool enabledTextBoxQuantity;

  final String? imageFeature;
  final String? price;
  final String? priceWithQuantity;

  /// Le Voile: the discount breakdown for THIS row, all three values ALREADY
  /// FORMATTED in the display currency, and all null together when the row
  /// carries no discount.
  ///
  /// Formatted rather than numeric on purpose: the currency and the
  /// conversion rate live on AppModel, which the row already reads, and doing
  /// the conversion once at the top keeps every layout from having to repeat
  /// it — and from quietly disagreeing about the rate.
  ///
  /// [priceBeforeDiscount] and [priceAfterDiscount] are PER UNIT, to sit
  /// beside [price], which is also per unit. [discountAmount] is the LINE
  /// total, because that is the money the customer keeps in their pocket and
  /// the figure that has to add up against the cart total.
  final String? priceBeforeDiscount;
  final String? priceAfterDiscount;
  final String? discountAmount;

  /// The name of that discount — the coupon code the customer typed, or the
  /// campaign title of an automatic one. Null when unnamed.
  final String? discountLabel;

  final bool isOnBackorder;
  final bool inStock;
  final dynamic limitQuantity;
  final void Function(BuildContext context, {required Product product})
  onTapProduct;

  CartItemStateUI({
    this.enableTopDivider,
    required this.enableBottomDivider,
    required this.product,
    this.cartItemMetaData,
    this.quantity,
    this.enabledTextBoxQuantity = true,
    this.onChangeQuantity,
    this.onRemove,
    required this.showStoreName,
    this.imageFeature,
    this.price,
    this.priceWithQuantity,
    this.priceBeforeDiscount,
    this.priceAfterDiscount,
    this.discountAmount,
    this.discountLabel,
    required this.isOnBackorder,
    required this.inStock,
    this.limitQuantity,
    required this.onTapProduct,
  });
}

extension CartStyleFromStringExt on String? {
  CartStyle toCartStyle() {
    if (this?.isEmpty ?? true) {
      return CartStyle.normal;
    }

    switch (this) {
      case 'style01':
        return CartStyle.style01;
      case 'normal':
      default:
        return CartStyle.normal;
    }
  }
}

extension CartItemStateExt on CartItemStateUI {
  /// Le Voile: true only when there is a real discount to draw on this row.
  bool get hasDiscount => discountAmount != null && priceAfterDiscount != null;

  bool get isPWGiftCardProduct =>
      cartItemMetaData?.pwGiftCardInfo != null && product.isPWGiftCardProduct;
  bool get showQuantity => !isPWGiftCardProduct && !product.isAppointment;
  bool showPrice(BuildContext context) {
    return !Services().widget.hideProductPrice(context, product) &&
        !isPWGiftCardProduct;
  }
}
