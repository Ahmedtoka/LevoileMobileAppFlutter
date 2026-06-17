import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../flux_config/flux_card_config.dart';
import '../flux_config/flux_image_config.dart';
import '../flux_config/text/flux_text_config.dart';
import '../rating_style_config.dart';
import 'user_tile_config.dart';

part 'product_review_tile_config.freezed.dart';
part 'product_review_tile_config.g.dart';

enum ProductReviewTileElement {
  userTile,
  image,
  reviewText;

  static const List<ProductReviewTileElement> defaultOrder = [
    image,
    reviewText,
    userTile,
  ];
}

@freezed
abstract class TestimonialStyle with _$TestimonialStyle {
  const TestimonialStyle._();

  const factory TestimonialStyle({
    @Default(FluxCardConfig()) FluxCardConfig cardConfig,
    @Default(8.0) double spacing,
    @Default(ProductReviewTileElement.defaultOrder)
    List<ProductReviewTileElement> elementOrder,
    FluxTextStyleConfig? userNameStyleConfig,
    FluxTextStyleConfig? reviewTextStyleConfig,
    FluxImageStyleConfig? imageStyleConfig,
    FluxImageStyleConfig? avatarStyleConfig,
    @Default(FluxRatingStyleConfig()) FluxRatingStyleConfig ratingStyleConfig,
  }) = _TestimonialStyle;

  factory TestimonialStyle.fromJson(Map<String, dynamic> json) =>
      _$TestimonialStyleFromJson(json);
}

@freezed
abstract class ProductReviewTileConfig with _$ProductReviewTileConfig {
  const ProductReviewTileConfig._();

  const factory ProductReviewTileConfig({
    String? id,
    String? imageUrl,
    String? reviewText,
    UserTileConfig? userTile,
    TestimonialStyle? style,
  }) = _ProductReviewTileConfig;

  TestimonialStyle get resolvedStyle => style ?? const TestimonialStyle();

  UserTileConfig? get resolvedUserTile {
    if (userTile == null) return null;
    final TestimonialStyle(
      :userNameStyleConfig,
      :reviewTextStyleConfig,
      :avatarStyleConfig,
      :ratingStyleConfig,
    ) = resolvedStyle;
    return userTile!.copyWith(
      nameStyleConfig: userNameStyleConfig,
      subtitleStyleConfig: reviewTextStyleConfig,
      avatarStyleConfig: avatarStyleConfig,
      ratingStyleConfig: ratingStyleConfig,
    );
  }

  factory ProductReviewTileConfig.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewTileConfigFromJson(json);
}
