import 'package:flutter/material.dart';

import '../../entities/entities.dart';
import '../flex_separated.dart';
import '../flux_image.dart';
import '../flux_widget/flux_card.dart';
import '../flux_widget/flux_text.dart';
import 'user_tile.dart';

class ProductReviewTile extends StatelessWidget {
  const ProductReviewTile({super.key, required this.config});

  final ProductReviewTileConfig config;

  @override
  Widget build(BuildContext context) {
    final ProductReviewTileConfig(
      :imageUrl,
      :reviewText,
      :resolvedUserTile,
      :resolvedStyle,
    ) = config;

    final TestimonialStyle(
      :cardConfig,
      :elementOrder,
      :spacing,
      :userNameStyleConfig,
      :reviewTextStyleConfig,
      :imageStyleConfig,
      :avatarStyleConfig,
    ) = resolvedStyle;

    return FluxCard(
      config: cardConfig,
      child: FlexSeparated.column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        separationSize: resolvedStyle.spacing,
        children: resolvedStyle.elementOrder.map((element) {
          switch (element) {
            case ProductReviewTileElement.userTile:
              return resolvedUserTile != null
                  ? UserTile(config: resolvedUserTile)
                  : const SizedBox.shrink();
            case ProductReviewTileElement.image:
              return imageUrl != null
                  ? FluxImage.fromStyleConfig(
                      imageUrl: imageUrl,
                      styleConfig: imageStyleConfig,
                    )
                  : const SizedBox.shrink();
            case ProductReviewTileElement.reviewText:
              return reviewText != null
                  ? FluxText.fromStyleConfig(
                      text: reviewText,
                      styleConfig: reviewTextStyleConfig,
                    )
                  : const SizedBox.shrink();
          }
        }).toList(),
      ),
    );
  }
}
