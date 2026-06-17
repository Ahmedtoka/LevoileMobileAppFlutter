// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review_tile_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestimonialStyle _$TestimonialStyleFromJson(Map<String, dynamic> json) =>
    _TestimonialStyle(
      cardConfig: json['cardConfig'] == null
          ? const FluxCardConfig()
          : FluxCardConfig.fromJson(json['cardConfig'] as Map<String, dynamic>),
      spacing: (json['spacing'] as num?)?.toDouble() ?? 8.0,
      elementOrder:
          (json['elementOrder'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ProductReviewTileElementEnumMap, e))
              .toList() ??
          ProductReviewTileElement.defaultOrder,
      userNameStyleConfig: json['userNameStyleConfig'] == null
          ? null
          : FluxTextStyleConfig.fromJson(
              json['userNameStyleConfig'] as Map<String, dynamic>,
            ),
      reviewTextStyleConfig: json['reviewTextStyleConfig'] == null
          ? null
          : FluxTextStyleConfig.fromJson(
              json['reviewTextStyleConfig'] as Map<String, dynamic>,
            ),
      imageStyleConfig: json['imageStyleConfig'] == null
          ? null
          : FluxImageStyleConfig.fromJson(
              json['imageStyleConfig'] as Map<String, dynamic>,
            ),
      avatarStyleConfig: json['avatarStyleConfig'] == null
          ? null
          : FluxImageStyleConfig.fromJson(
              json['avatarStyleConfig'] as Map<String, dynamic>,
            ),
      ratingStyleConfig: json['ratingStyleConfig'] == null
          ? const FluxRatingStyleConfig()
          : FluxRatingStyleConfig.fromJson(
              json['ratingStyleConfig'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$TestimonialStyleToJson(_TestimonialStyle instance) =>
    <String, dynamic>{
      'cardConfig': instance.cardConfig.toJson(),
      'spacing': instance.spacing,
      'elementOrder': instance.elementOrder
          .map((e) => _$ProductReviewTileElementEnumMap[e]!)
          .toList(),
      'userNameStyleConfig': instance.userNameStyleConfig?.toJson(),
      'reviewTextStyleConfig': instance.reviewTextStyleConfig?.toJson(),
      'imageStyleConfig': instance.imageStyleConfig?.toJson(),
      'avatarStyleConfig': instance.avatarStyleConfig?.toJson(),
      'ratingStyleConfig': instance.ratingStyleConfig.toJson(),
    };

const _$ProductReviewTileElementEnumMap = {
  ProductReviewTileElement.userTile: 'userTile',
  ProductReviewTileElement.image: 'image',
  ProductReviewTileElement.reviewText: 'reviewText',
};

_ProductReviewTileConfig _$ProductReviewTileConfigFromJson(
  Map<String, dynamic> json,
) => _ProductReviewTileConfig(
  id: json['id'] as String?,
  imageUrl: json['imageUrl'] as String?,
  reviewText: json['reviewText'] as String?,
  userTile: json['userTile'] == null
      ? null
      : UserTileConfig.fromJson(json['userTile'] as Map<String, dynamic>),
  style: json['style'] == null
      ? null
      : TestimonialStyle.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductReviewTileConfigToJson(
  _ProductReviewTileConfig instance,
) => <String, dynamic>{
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'reviewText': instance.reviewText,
  'userTile': instance.userTile?.toJson(),
  'style': instance.style?.toJson(),
};
