// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_list_view_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxListViewConfig _$FluxListViewConfigFromJson(Map<String, dynamic> json) =>
    _FluxListViewConfig(
      itemSize: json['itemSize'] == null
          ? _defaultItemSize
          : ItemSizeAdvanceConfig.fromJson(
              json['itemSize'] as Map<String, dynamic>,
            ),
      itemSpacing: (json['itemSpacing'] as num?)?.toDouble() ?? _defaultSpacing,
      padding: const EdgeInsetsDirectionalConverter().fromJson(
        json['padding'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$FluxListViewConfigToJson(
  _FluxListViewConfig instance,
) => <String, dynamic>{
  'itemSize': instance.itemSize.toJson(),
  'itemSpacing': instance.itemSpacing,
  'padding': const EdgeInsetsDirectionalConverter().toJson(instance.padding),
};
