// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_grid_layout_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardGridLayoutConfig _$CardGridLayoutConfigFromJson(
  Map<String, dynamic> json,
) => _CardGridLayoutConfig(
  gridConfig: json['gridConfig'] == null
      ? const FluxGridViewConfig()
      : FluxGridViewConfig.fromJson(json['gridConfig'] as Map<String, dynamic>),
  items: (json['items'] as List<dynamic>)
      .map((e) => CardGridItemConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
  borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$CardGridLayoutConfigToJson(
  _CardGridLayoutConfig instance,
) => <String, dynamic>{
  'gridConfig': instance.gridConfig.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'borderRadius': instance.borderRadius,
};
