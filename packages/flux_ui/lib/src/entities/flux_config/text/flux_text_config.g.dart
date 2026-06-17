// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_text_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxTextConfig _$FluxTextConfigFromJson(Map<String, dynamic> json) =>
    _FluxTextConfig(
      text: json['text'] as String? ?? '',
      styleConfig: json['styleConfig'] == null
          ? null
          : FluxTextStyleConfig.fromJson(
              json['styleConfig'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluxTextConfigToJson(_FluxTextConfig instance) =>
    <String, dynamic>{
      'text': instance.text,
      'styleConfig': instance.styleConfig?.toJson(),
    };

_FluxTextStyleConfig _$FluxTextStyleConfigFromJson(Map<String, dynamic> json) =>
    _FluxTextStyleConfig(
      styleSource: $enumDecodeNullable(
        _$TextStyleSourceEnumMap,
        json['styleSource'],
      ),
      customStyle: json['customStyle'] == null
          ? null
          : AppTextStyle.fromJson(json['customStyle'] as Map<String, dynamic>),
      textOverflow: $enumDecodeNullable(
        _$TextOverflowEnumMap,
        json['textOverflow'],
      ),
      maxLines: (json['maxLines'] as num?)?.toInt(),
      minLines: (json['minLines'] as num?)?.toInt(),
      textAlign: $enumDecodeNullable(_$TextAlignEnumMap, json['textAlign']),
      containerConfig: json['containerConfig'] == null
          ? null
          : FluxContainerConfig.fromJson(
              json['containerConfig'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluxTextStyleConfigToJson(
  _FluxTextStyleConfig instance,
) => <String, dynamic>{
  'styleSource': _$TextStyleSourceEnumMap[instance.styleSource],
  'customStyle': instance.customStyle?.toJson(),
  'textOverflow': _$TextOverflowEnumMap[instance.textOverflow],
  'maxLines': instance.maxLines,
  'minLines': instance.minLines,
  'textAlign': _$TextAlignEnumMap[instance.textAlign],
  'containerConfig': instance.containerConfig?.toJson(),
};

const _$TextStyleSourceEnumMap = {
  TextStyleSource.displayLarge: 'displayLarge',
  TextStyleSource.displayMedium: 'displayMedium',
  TextStyleSource.displaySmall: 'displaySmall',
  TextStyleSource.headlineLarge: 'headlineLarge',
  TextStyleSource.headlineMedium: 'headlineMedium',
  TextStyleSource.headlineSmall: 'headlineSmall',
  TextStyleSource.titleLarge: 'titleLarge',
  TextStyleSource.titleMedium: 'titleMedium',
  TextStyleSource.titleSmall: 'titleSmall',
  TextStyleSource.labelLarge: 'labelLarge',
  TextStyleSource.labelMedium: 'labelMedium',
  TextStyleSource.labelSmall: 'labelSmall',
  TextStyleSource.bodyLarge: 'bodyLarge',
  TextStyleSource.bodyMedium: 'bodyMedium',
  TextStyleSource.bodySmall: 'bodySmall',
};

const _$TextOverflowEnumMap = {
  TextOverflow.clip: 'clip',
  TextOverflow.fade: 'fade',
  TextOverflow.ellipsis: 'ellipsis',
  TextOverflow.visible: 'visible',
};

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};
