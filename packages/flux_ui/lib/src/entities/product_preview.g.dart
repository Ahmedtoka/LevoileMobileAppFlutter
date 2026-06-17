// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductPreview _$ProductPreviewFromJson(Map<String, dynamic> json) =>
    _ProductPreview(
      title: json['title'] as String,
      textPrice: json['textPrice'] as String,
      imageUrl: json['imageUrl'] as String,
      textDiscountedPrice: json['textDiscountedPrice'] as String?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
      colorVariants: const ListColorConverter().fromJson(
        json['colorVariants'] as List?,
      ),
    );

Map<String, dynamic> _$ProductPreviewToJson(
  _ProductPreview instance,
) => <String, dynamic>{
  'title': instance.title,
  'textPrice': instance.textPrice,
  'imageUrl': instance.imageUrl,
  'textDiscountedPrice': instance.textDiscountedPrice,
  'discountPercentage': instance.discountPercentage,
  'isFavorite': instance.isFavorite,
  'colorVariants': const ListColorConverter().toJson(instance.colorVariants),
};
