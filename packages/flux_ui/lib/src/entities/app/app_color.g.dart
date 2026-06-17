// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolidColor _$SolidColorFromJson(Map<String, dynamic> json) => SolidColor(
  const ColorConverter().fromJson(json['color']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SolidColorToJson(SolidColor instance) =>
    <String, dynamic>{
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };

ThemeColor _$ThemeColorFromJson(Map<String, dynamic> json) => ThemeColor(
  $enumDecode(_$MaterialColorNameEnumMap, json['materialColorName']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ThemeColorToJson(
  ThemeColor instance,
) => <String, dynamic>{
  'materialColorName': _$MaterialColorNameEnumMap[instance.materialColorName]!,
  'runtimeType': instance.$type,
};

const _$MaterialColorNameEnumMap = {
  MaterialColorName.primary: 'primary',
  MaterialColorName.secondary: 'secondary',
  MaterialColorName.background: 'background',
  MaterialColorName.surface: 'surface',
  MaterialColorName.error: 'error',
  MaterialColorName.onPrimary: 'onPrimary',
  MaterialColorName.onSecondary: 'onSecondary',
  MaterialColorName.onSurface: 'onSurface',
};
