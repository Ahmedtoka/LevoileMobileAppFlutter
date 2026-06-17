// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_card_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxCardConfig _$FluxCardConfigFromJson(
  Map<String, dynamic> json,
) => _FluxCardConfig(
  color: const ColorConverter().fromJson(json['color']),
  shadowColor: const ColorConverter().fromJson(json['shadowColor']),
  surfaceTintColor: const ColorConverter().fromJson(json['surfaceTintColor']),
  elevation: (json['elevation'] as num?)?.toDouble(),
  borderRadius: json['borderRadius'] == null
      ? BorderRadiusDirectional.zero
      : const BorderRadiusDirectionalConverter().fromJson(
          json['borderRadius'] as Map<String, dynamic>?,
        ),
  borderSide: json['borderSide'] == null
      ? BorderSide.none
      : const BorderSideConverter().fromJson(
          json['borderSide'] as Map<String, dynamic>?,
        ),
  clipBehavior: const ClipConverter().fromJson(json['clipBehavior'] as String?),
  margin: const EdgeInsetsDirectionalConverter().fromJson(
    json['margin'] as Map<String, dynamic>?,
  ),
  contentPadding: const EdgeInsetsDirectionalConverter().fromJson(
    json['contentPadding'] as Map<String, dynamic>?,
  ),
);

Map<String, dynamic> _$FluxCardConfigToJson(
  _FluxCardConfig instance,
) => <String, dynamic>{
  'color': const ColorConverter().toJson(instance.color),
  'shadowColor': const ColorConverter().toJson(instance.shadowColor),
  'surfaceTintColor': const ColorConverter().toJson(instance.surfaceTintColor),
  'elevation': instance.elevation,
  'borderRadius': const BorderRadiusDirectionalConverter().toJson(
    instance.borderRadius,
  ),
  'borderSide': const BorderSideConverter().toJson(instance.borderSide),
  'clipBehavior': const ClipConverter().toJson(instance.clipBehavior),
  'margin': const EdgeInsetsDirectionalConverter().toJson(instance.margin),
  'contentPadding': const EdgeInsetsDirectionalConverter().toJson(
    instance.contentPadding,
  ),
};
