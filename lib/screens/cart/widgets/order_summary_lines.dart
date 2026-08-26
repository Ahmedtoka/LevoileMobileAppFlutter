import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools/price_tools.dart';
import '../../../models/cart/cart_base.dart';

/// Le Voile: the lines that explain how a cart total was arrived at —
/// subtotal, shipping, tax, and any discount — WITHOUT the total itself,
/// which each caller prints in its own size and place.
///
/// These used to live only inside a modal sheet the customer had to tap a
/// small arrow to open. A shopper who had just typed a coupon saw a total
/// that was 253 lower than the pieces added up to and no explanation on
/// screen: the subtotal, the coupon and the saving were all one tap away,
/// behind an arrow nothing invited them to press. Now the cart bar prints
/// them itself, and this widget is the single source both it and any sheet
/// read from, so the two can never disagree about the arithmetic.
///
/// Every row is guarded: a cart with no shipping, no tax and no discount
/// renders nothing at all, because "Subtotal 2,530" sitting above a total of
/// 2,530 explains nothing and only costs the cart list a strip of screen.
/// [hasAnyLine] answers that same question for a caller that needs to know
/// before it lays anything out.
class OrderSummaryLines extends StatelessWidget {
  const OrderSummaryLines({
    super.key,
    required this.currencyRate,
    this.currency,
    this.labelStyle,
    this.valueStyle,
    this.showDividers = false,
    this.spacing = 10,
  });

  final String? currency;
  final Map<String, dynamic> currencyRate;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  /// The sheet separates its rows with rules; the cart bar is tighter and
  /// spaces them instead.
  final bool showDividers;
  final double spacing;

  /// Whether this cart has anything to explain at all.
  static bool hasAnyLine(CartModel cart) {
    return (cart.getShippingCost() ?? 0) > 0 ||
        cart.taxesTotal > 0 ||
        cart.rewardTotal > 0 ||
        (cart.couponObj?.amount ?? 0) > 0;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    if (!hasAnyLine(cart)) {
      return const SizedBox.shrink();
    }

    final usedCurrency = cart.isWalletCart()
        ? kAdvanceConfig.defaultCurrency?.currencyCode
        : currency;

    String money(double? value) => PriceTools.getCurrencyFormatted(
      value ?? 0,
      currencyRate,
      currency: usedCurrency,
    )!;

    final rows = <Widget>[
      _row(context, S.of(context).subtotal, money(cart.getSubTotal())),
      if ((cart.getShippingCost() ?? 0) > 0)
        _row(context, S.of(context).shipping, money(cart.getShippingCost())),
      if (cart.taxesTotal > 0)
        _row(context, S.of(context).tax, money(cart.taxesTotal)),
      if (cart.rewardTotal > 0)
        _row(
          context,
          S.of(context).cartDiscount,
          '- ${money(cart.rewardTotal)}',
          isDiscount: true,
        ),
      if ((cart.couponObj?.amount ?? 0) > 0)
        _row(
          context,
          '${S.of(context).couponCode}: ${cart.couponObj!.code}',
          cart.couponObj!.discountType == 'percent'
              ? '-${cart.couponObj!.amount}%'
              : '- ${money(cart.couponObj!.amount)}',
          isDiscount: true,
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          rows[i],
          if (i < rows.length - 1)
            showDividers
                ? const Divider(height: 24)
                : SizedBox(height: spacing),
        ],
      ],
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value, {
    bool isDiscount = false,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: labelStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: isDiscount
              ? (valueStyle ?? const TextStyle()).copyWith(
                  color: Theme.of(context).colorScheme.error,
                )
              : valueStyle,
        ),
      ],
    );
  }
}
