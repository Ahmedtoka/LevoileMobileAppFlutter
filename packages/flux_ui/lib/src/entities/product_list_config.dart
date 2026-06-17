import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/converters/edge_insets_directional_converter.dart';
import 'image_config.dart';
import 'item_size_advance_config.dart';

part 'product_list_config.freezed.dart';
part 'product_list_config.g.dart';

const _defaultItemSpacing = 16.0;
const _defaultItemSizeConfig = ItemSizeAdvanceConfig(
  value: 2,
  type: ItemSizeAdvanceType.gridColumns,
);
const _defaultPadding = EdgeInsetsDirectional.all(16);

@freezed
abstract class ProductListConfig with _$ProductListConfig {
  const factory ProductListConfig({
    @Default(_defaultItemSpacing) double itemSpacing,
    @Default(_defaultItemSizeConfig) ItemSizeAdvanceConfig itemSizeConfig,
    @EdgeInsetsDirectionalConverter()
    @Default(_defaultPadding)
    EdgeInsetsDirectional? padding,
    @Default(ImageConfig()) ImageConfig imageConfig,
  }) = _ProductListConfig;

  factory ProductListConfig.fromJson(Map<String, dynamic> json) =>
      _$ProductListConfigFromJson(json);
}
