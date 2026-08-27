import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../cart_item_state_ui.dart';

/// Le Voile: a cart row's price, and — when a discount touched this row —
/// what it became and how much came off it.
///
/// The cart used to print one full price per row and a single total at the
/// bottom: "Congratulations! Coupon code applied successfully - 253.00LE".
/// Four pieces, one number, and no way for the customer to tell which piece
/// the 253 came off or what any one of them costs now. This block answers
/// both questions on the row itself:
///
///     1,200.00LE  1,080.00LE
///     🏷 NEW682226        - 120.00LE
///
/// With no discount it renders exactly the single price line it replaced, so
/// every undiscounted cart looks untouched.
class CartItemPriceBlock extends StatelessWidget {
  const CartItemPriceBlock(
    this.stateUI, {
    super.key,
    this.fontSize = 13,
    this.color,
  });

  final CartItemStateUI stateUI;
  final double fontSize;

  /// The colour the row already prints its price in. Passed rather than read
  /// from the theme so this block cannot drift from the layout around it.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final price = stateUI.price;
    if (price == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final priceColor = color ?? theme.colorScheme.secondary;
    final priceStyle = TextStyle(color: priceColor, fontSize: fontSize);

    if (!stateUI.hasDiscount) {
      // Le Voile: the piece's own markdown. Not a cart discount, so it gets no
      // "🏷 Discount − X" line — there is no coupon to name, and labelling the
      // shop's own sale price as a discount the customer earned would be a
      // second, wrong claim on the same row.
      final wasPrice = stateUI.priceBeforeSale;
      if (wasPrice == null) {
        return Text(price, style: priceStyle);
      }

      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Text(
            wasPrice,
            style: priceStyle.copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: priceColor.withValues(alpha: 0.6),
              color: priceColor.withValues(alpha: 0.6),
            ),
          ),
          Text(price, style: priceStyle.copyWith(fontWeight: FontWeight.w700)),
        ],
      );
    }

    // The same red the cart summary already uses for its discount amounts — a
    // second colour here would read as a different KIND of number.
    final discountColor = theme.colorScheme.error;
    final label = stateUI.discountLabel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            // Struck out and greyed: the old price has to stay legible enough
            // to be compared against, without competing with the price the
            // customer is actually paying.
            Text(
              stateUI.priceBeforeDiscount ?? price,
              style: priceStyle.copyWith(
                decoration: TextDecoration.lineThrough,
                decorationColor: priceColor.withValues(alpha: 0.6),
                color: priceColor.withValues(alpha: 0.6),
              ),
            ),
            Text(
              stateUI.priceAfterDiscount!,
              style: priceStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Icon(
                Icons.local_offer_outlined,
                size: fontSize,
                color: discountColor,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label?.isNotEmpty ?? false
                      ? '${S.of(context).discount} · $label'
                      : S.of(context).discount,
                  style: TextStyle(color: discountColor, fontSize: fontSize - 1),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '- ${stateUI.discountAmount}',
                style: TextStyle(
                  color: discountColor,
                  fontSize: fontSize - 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
