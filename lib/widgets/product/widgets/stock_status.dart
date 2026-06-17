import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

import '../../../common/config.dart';
import '../../../models/index.dart' show Product;
import '../../../modules/dynamic_layout/config/product_config.dart';

class StockStatus extends StatelessWidget {
  final Product product;
  final ProductConfig config;

  const StockStatus({super.key, required this.product, required this.config});

  @override
  Widget build(BuildContext context) {
    if (!config.showStockStatus) {
      return const SizedBox();
    }

    var stockQuantity = '';
    if (config.showStockQuantity && product.stockQuantity != null) {
      stockQuantity = ' (${product.stockQuantity})';
    }

    var statusText = '';
    Color? statusColor;
    var showQuantity = true;

    if (product.backordersAllowed) {
      statusText = S.of(context).backOrder;
      statusColor = kStockColor.backorder;
    } else if (product.inStock != null && !product.isEmptyProduct()) {
      final inStock = product.checkInStock() ?? false;
      // Le Voile: show availability as a simple In Stock / Out of Stock label
      // without any quantity numbers.
      statusText = inStock ? S.of(context).inStock : S.of(context).outOfStock;
      // Le Voile: In Stock uses the brand magenta instead of the default teal.
      statusColor =
          inStock ? Theme.of(context).primaryColor : kStockColor.outOfStock;
      showQuantity = false;
    } else {
      return const SizedBox();
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: statusText,
            style: TextStyle(color: statusColor, fontSize: 12),
          ),
          if (stockQuantity.isNotEmpty && showQuantity)
            TextSpan(
              text: stockQuantity,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.apply(fontSizeFactor: 0.7),
            ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
