import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/converters/list_color_converter.dart';

part 'product_preview.freezed.dart';
part 'product_preview.g.dart';

@freezed
abstract class ProductPreview with _$ProductPreview {
  const factory ProductPreview({
    required String title,
    required String textPrice,
    required String imageUrl,
    String? textDiscountedPrice,
    double? discountPercentage,
    @Default(false) bool isFavorite,
    @ListColorConverter() List<Color>? colorVariants,
  }) = _ProductPreview;

  factory ProductPreview.fromJson(Map<String, dynamic> json) =>
      _$ProductPreviewFromJson(json);

  const ProductPreview._();

  bool get hasDiscount => textDiscountedPrice != null;
}
