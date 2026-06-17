// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductListConfig _$ProductListConfigFromJson(Map<String, dynamic> json) =>
    _ProductListConfig(
      itemSpacing:
          (json['itemSpacing'] as num?)?.toDouble() ?? _defaultItemSpacing,
      itemSizeConfig: json['itemSizeConfig'] == null
          ? _defaultItemSizeConfig
          : ItemSizeAdvanceConfig.fromJson(
              json['itemSizeConfig'] as Map<String, dynamic>,
            ),
      padding: json['padding'] == null
          ? _defaultPadding
          : const EdgeInsetsDirectionalConverter().fromJson(
              json['padding'] as Map<String, dynamic>?,
            ),
      imageConfig: json['imageConfig'] == null
          ? const ImageConfig()
          : ImageConfig.fromJson(json['imageConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductListConfigToJson(
  _ProductListConfig instance,
) => <String, dynamic>{
  'itemSpacing': instance.itemSpacing,
  'itemSizeConfig': instance.itemSizeConfig.toJson(),
  'padding': const EdgeInsetsDirectionalConverter().toJson(instance.padding),
  'imageConfig': instance.imageConfig.toJson(),
};
