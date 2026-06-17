import 'package:flutter/material.dart';

import '../../entities/testimonial/user_tile_config.dart';
import '../flux_image.dart';
import '../flux_widget/flux_rating.dart';
import '../flux_widget/flux_text.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.config});

  final UserTileConfig config;

  @override
  Widget build(BuildContext context) {
    final UserTileConfig(
      :avatarUrl,
      :avatarStyleConfig,
      :name,
      :nameStyleConfig,
      :subtitle,
      :subtitleStyleConfig,
      :rating,
      :resolvedRatingStyleConfig,
      :contentPadding,
    ) = config;

    return ListTile(
      contentPadding: config.contentPadding,
      leading: avatarUrl == null
          ? null
          : FluxImage.fromStyleConfig(
              imageUrl: avatarUrl,
              styleConfig: avatarStyleConfig,
            ),
      title: FluxText.fromStyleConfig(text: name, styleConfig: nameStyleConfig),
      subtitle: subtitle != null
          ? FluxText.fromStyleConfig(
              text: subtitle,
              styleConfig: subtitleStyleConfig,
            )
          : null,
      trailing: rating != null
          ? FluxRating(rating: rating, styleConfig: resolvedRatingStyleConfig)
          : null,
    );
  }
}
