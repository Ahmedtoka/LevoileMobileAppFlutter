import 'package:flutter/material.dart';

import '../core/extensions/item_size_config_ext.dart';
import '../entities/product_list_config.dart';
import '../entities/product_preview.dart';
import 'color_variant_product_card.dart';
import 'flex_separated.dart';

class ProductListHorizontalPreview extends StatelessWidget {
  final ProductListConfig config;
  final List<ProductPreview> productPreviews;
  final VoidCallback? onProductTap;
  final VoidCallback? onFavoriteToggle;

  const ProductListHorizontalPreview({
    super.key,
    required this.config,
    required this.productPreviews,
    this.onProductTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: config.padding,
      scrollDirection: Axis.horizontal,
      child: FlexSeparated.rowBuilder(
        crossAxisAlignment: CrossAxisAlignment.start,
        itemCount: productPreviews.length,
        separationSize: config.itemSpacing,
        itemBuilder: (index) {
          final productConfig = productPreviews[index];
          return SizedBox(
            width: config.itemSizeConfig.calculateItemSize(
              context,
              startPadding: config.padding?.start,
              spacing: config.itemSpacing,
            ),
            child: ColorVariantProductCard(
              productPreview: productConfig,
              imageConfig: config.imageConfig,
              onTap: onProductTap,
              onFavoritePressed: onFavoriteToggle,
            ),
          );
        },
      ),
    );
  }
}
