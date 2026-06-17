// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_edge_insets_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxEdgeInsetsConfig _$FluxEdgeInsetsConfigFromJson(
  Map<String, dynamic> json,
) => _FluxEdgeInsetsConfig(
  start:
      (_EdgeConfigHelper.parseOldConfig(json, 'start') as num?)?.toDouble() ??
      0,
  end: (_EdgeConfigHelper.parseOldConfig(json, 'end') as num?)?.toDouble() ?? 0,
  top: (json['top'] as num?)?.toDouble() ?? 0,
  bottom: (json['bottom'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$FluxEdgeInsetsConfigToJson(
  _FluxEdgeInsetsConfig instance,
) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
  'top': instance.top,
  'bottom': instance.bottom,
};
