// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_text_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppTextStyle _$AppTextStyleFromJson(Map<String, dynamic> json) =>
    _AppTextStyle(
      color: json['color'] == null
          ? null
          : AppColor.fromJson(json['color'] as Map<String, dynamic>),
      backgroundColor: json['backgroundColor'] == null
          ? null
          : AppColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: const FontWeightConverter().fromJson(
        json['fontWeight'] as String?,
      ),
      fontStyle: $enumDecodeNullable(_$FontStyleEnumMap, json['fontStyle']),
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      shadows: const ShadowsConverter().fromJson(
        json['shadows'] as List<Map<String, dynamic>>?,
      ),
      decoration: const TextDecorationConverter().fromJson(
        json['decoration'] as String?,
      ),
      decorationColor: json['decorationColor'] == null
          ? null
          : AppColor.fromJson(json['decorationColor'] as Map<String, dynamic>),
      decorationStyle: $enumDecodeNullable(
        _$TextDecorationStyleEnumMap,
        json['decorationStyle'],
      ),
      decorationThickness: (json['decorationThickness'] as num?)?.toDouble(),
      fontFamily: json['fontFamily'] as String?,
      overflow: $enumDecodeNullable(_$TextOverflowEnumMap, json['overflow']),
    );

Map<String, dynamic> _$AppTextStyleToJson(_AppTextStyle instance) =>
    <String, dynamic>{
      'color': instance.color?.toJson(),
      'backgroundColor': instance.backgroundColor?.toJson(),
      'fontSize': instance.fontSize,
      'fontWeight': const FontWeightConverter().toJson(instance.fontWeight),
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle],
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'height': instance.height,
      'shadows': const ShadowsConverter().toJson(instance.shadows),
      'decoration': const TextDecorationConverter().toJson(instance.decoration),
      'decorationColor': instance.decorationColor?.toJson(),
      'decorationStyle': _$TextDecorationStyleEnumMap[instance.decorationStyle],
      'decorationThickness': instance.decorationThickness,
      'fontFamily': instance.fontFamily,
      'overflow': _$TextOverflowEnumMap[instance.overflow],
    };

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};

const _$TextDecorationStyleEnumMap = {
  TextDecorationStyle.solid: 'solid',
  TextDecorationStyle.double: 'double',
  TextDecorationStyle.dotted: 'dotted',
  TextDecorationStyle.dashed: 'dashed',
  TextDecorationStyle.wavy: 'wavy',
};

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.fade: 'fade',
  TextOverflow.ellipsis: 'ellipsis',
  TextOverflow.visible: 'visible',
};
