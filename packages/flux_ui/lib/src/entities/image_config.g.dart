// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageConfig _$ImageConfigFromJson(Map<String, dynamic> json) => _ImageConfig(
  aspectRatio:
      (json['aspectRatio'] as num?)?.toDouble() ?? _defaultImageAspectRatio,
  color: const ColorConverter().fromJson(json['color']),
  fit: const BoxFitConverter().fromJson(json['fit'] as String?),
  borderRadius: json['borderRadius'] == null
      ? _defaultImageBorderRadius
      : const BorderRadiusDirectionalConverter().fromJson(
          json['borderRadius'] as Map<String, dynamic>?,
        ),
);

Map<String, dynamic> _$ImageConfigToJson(_ImageConfig instance) =>
    <String, dynamic>{
      'aspectRatio': instance.aspectRatio,
      'color': const ColorConverter().toJson(instance.color),
      'fit': const BoxFitConverter().toJson(instance.fit),
      'borderRadius': const BorderRadiusDirectionalConverter().toJson(
        instance.borderRadius,
      ),
    };
