// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_image_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxImageConfig _$FluxImageConfigFromJson(Map<String, dynamic> json) =>
    _FluxImageConfig(
      url: json['url'] as String? ?? '',
      styleConfig: json['styleConfig'] == null
          ? null
          : FluxImageStyleConfig.fromJson(
              json['styleConfig'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluxImageConfigToJson(_FluxImageConfig instance) =>
    <String, dynamic>{
      'url': instance.url,
      'styleConfig': instance.styleConfig?.toJson(),
    };

_FluxImageStyleConfig _$FluxImageStyleConfigFromJson(
  Map<String, dynamic> json,
) => _FluxImageStyleConfig(
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  aspectRatio: (json['aspectRatio'] as num?)?.toDouble(),
  borderRadius: const BorderRadiusDirectionalConverter().fromJson(
    json['borderRadius'] as Map<String, dynamic>?,
  ),
  fit: const BoxFitConverter().fromJson(json['fit'] as String?),
  color: const ColorConverter().fromJson(json['color']),
  alignment: const AlignmentDirectionalConverter().fromJson(
    json['alignment'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$FluxImageStyleConfigToJson(
  _FluxImageStyleConfig instance,
) => <String, dynamic>{
  'width': instance.width,
  'height': instance.height,
  'aspectRatio': instance.aspectRatio,
  'borderRadius':
      _$JsonConverterToJson<Map<String, dynamic>?, BorderRadiusDirectional>(
        instance.borderRadius,
        const BorderRadiusDirectionalConverter().toJson,
      ),
  'fit': const BoxFitConverter().toJson(instance.fit),
  'color': const ColorConverter().toJson(instance.color),
  'alignment': const AlignmentDirectionalConverter().toJson(instance.alignment),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
