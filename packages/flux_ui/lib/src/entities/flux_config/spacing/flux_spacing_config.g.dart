// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_spacing_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxSpacingConfig _$FluxSpacingConfigFromJson(
  Map<String, dynamic> json,
) => _FluxSpacingConfig(
  marginConfig: json['margin'] == null
      ? null
      : FluxEdgeInsetsConfig.fromJson(json['margin'] as Map<String, dynamic>),
  paddingConfig: json['padding'] == null
      ? null
      : FluxEdgeInsetsConfig.fromJson(json['padding'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluxSpacingConfigToJson(_FluxSpacingConfig instance) =>
    <String, dynamic>{
      'margin': instance.marginConfig?.toJson(),
      'padding': instance.paddingConfig?.toJson(),
    };
