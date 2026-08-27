import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/tools/price_tools.dart';
import '../../../models/index.dart';
import '../../../widgets/product/quantity_selection/quantity_selection.dart';

const _kProductItemHeight = 110.0;

class ProductReviewWidget extends StatelessWidget {
  final ProductItem item;
  final bool isWalletTopup;
  final String? currency;

  const ProductReviewWidget({
    super.key,
    required this.item,
    this.isWalletTopup = false,
    this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context, listen: false);
    var rates = cartModel.currencyRates;
    final colorTitle = Theme.of(context).colorScheme.secondary;
    final styleTitle = TextStyle(color: colorTitle);
    var addonsOptions = {};
    if (item.addonsOptions.isNotEmpty) {
      for (var element in item.addonsOptions.keys) {
        addonsOptions[element] = Tools.getFileNameFromUrl(
          item.addonsOptions[element]!,
        );
      }
    }
    final currencySelected = isWalletTopup
        ? kAdvanceConfig.defaultCurrency?.currencyCode
        : cartModel.currencyCode;
    if (currency != null && currencySelected == currency) {
      rates = null;
    }

    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: FluxImage(
              imageUrl: item.featuredImage ?? '',
              fit: BoxFit.fitHeight,
              width: _kProductItemHeight,
              height: _kProductItemHeight,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.name ?? '',
                  style: styleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.appointmentDate != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    item.appointmentDate!,
                    style: styleTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (addonsOptions.keys.isNotEmpty)
                  HtmlWidget(addonsOptions.values.join(', ')),
                const SizedBox(height: 7),
                // Le Voile: the receipt shows the SAME before/after the cart
                // showed. A customer who chose a piece because it was reduced,
                // or typed a coupon to get money off, should be able to see
                // that saving on the thing that proves what they paid.
                //
                // `subtotal` is the line before anything came off and `total`
                // is what they actually paid — both already exist on
                // ProductItem, and the snapshot in shopify/index.dart is what
                // fills them. Equal values mean nothing came off this line, so
                // it prints exactly the single price it always did.
                Builder(
                  builder: (context) {
                    // ⚠️ Both are Strings on ProductItem, not numbers — the
                    // stock model stores every amount as `.toString()`. They
                    // have to be parsed before they can be compared, or the
                    // strike-through would trigger on text ordering.
                    final total = double.tryParse('${item.total ?? ''}') ?? 0.0;
                    final before =
                        double.tryParse('${item.subtotal ?? ''}') ?? total;
                    String money(double v) => PriceTools.getCurrencyFormatted(
                      v,
                      rates,
                      currency: currency ?? currencySelected,
                    )!;

                    if (before <= total) {
                      return Text(
                        money(total),
                        style: TextStyle(color: colorTitle, fontSize: 14),
                      );
                    }

                    return Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        Text(
                          money(before),
                          style: TextStyle(
                            color: colorTitle.withValues(alpha: 0.55),
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: colorTitle.withValues(alpha: 0.55),
                          ),
                        ),
                        Text(
                          money(total),
                          style: TextStyle(
                            color: colorTitle,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                QuantitySelection(
                  enabled: false,
                  color: colorTitle,
                  value: item.quantity,
                  style: QuantitySelectionStyle.normal,
                  width: 60,
                  height: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
