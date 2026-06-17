// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IconConfig _$IconConfigFromJson(Map<String, dynamic> json) => _IconConfig(
  icon: json['icon'] as String,
  fontFamily: json['fontFamily'] as String,
  colorString: json['color'] as String?,
  size: (json['size'] as num?)?.toDouble(),
);

Map<String, dynamic> _$IconConfigToJson(_IconConfig instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'fontFamily': instance.fontFamily,
      'color': instance.colorString,
      'size': instance.size,
    };
