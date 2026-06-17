// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacing_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpacingConfig _$SpacingConfigFromJson(Map<String, dynamic> json) =>
    _SpacingConfig(
      marginConfig: json['margin'] == null
          ? null
          : EdgeConfig.fromJson(json['margin'] as Map<String, dynamic>),
      paddingConfig: json['padding'] == null
          ? null
          : EdgeConfig.fromJson(json['padding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpacingConfigToJson(_SpacingConfig instance) =>
    <String, dynamic>{
      'margin': instance.marginConfig?.toJson(),
      'padding': instance.paddingConfig?.toJson(),
    };
