// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderConfig _$OrderConfigFromJson(Map<String, dynamic> json) => _OrderConfig(
  version: (json['version'] as num?)?.toInt() ?? 1,
  enableReorder: json['enableReorder'] as bool? ?? true,
);

Map<String, dynamic> _$OrderConfigToJson(_OrderConfig instance) =>
    <String, dynamic>{
      'version': instance.version,
      'enableReorder': instance.enableReorder,
    };
