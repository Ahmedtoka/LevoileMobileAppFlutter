import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../../models/entities/product.dart';
import '../../../../modules/dynamic_layout/config/product_config.dart';
import '../../../../widgets/common/star_rating.dart';

class RatingItem extends StatelessWidget {
  final Product item;
  final ProductConfig config;
  final MainAxisAlignment alignment;

  const RatingItem({
    required this.item,
    required this.config,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    if (!config.enableRating || !item.availableRating) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    final starSize = Tools.isTablet(MediaQuery.of(context)) ? 20.0 : 12.0;
    final totalReview = item.totalReview ?? 0;
    final averageRating = item.averageRating ?? 0.0;

    return Row(
      mainAxisAlignment: alignment,
      children: <Widget>[
        SmoothStarRating(
          allowHalfRating: true,
          starCount: 5,
          rating: averageRating,
          size: starSize,
          color: theme.primaryColor,
          borderColor: theme.primaryColor,
          spacing: 0.0,
          label: totalReview > 0
              ? Text('${averageRating.toStringAsFixed(1)} ($totalReview)')
              : null,
        ),
      ],
    );
  }
}
