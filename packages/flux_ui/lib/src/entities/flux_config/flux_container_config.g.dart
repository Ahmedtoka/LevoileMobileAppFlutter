// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_container_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxContainerConfig _$FluxContainerConfigFromJson(Map<String, dynamic> json) =>
    _FluxContainerConfig(
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      padding: const EdgeInsetsDirectionalConverter().fromJson(
        json['padding'] as Map<String, dynamic>?,
      ),
      margin: const EdgeInsetsDirectionalConverter().fromJson(
        json['margin'] as Map<String, dynamic>?,
      ),
      decoration: const DecorationConverter().fromJson(
        json['decoration'] as Map<String, dynamic>?,
      ),
      alignment: const AlignmentDirectionalConverter().fromJson(
        json['alignment'] as Map<String, dynamic>?,
      ),
      constraints: const ConstraintsConverter().fromJson(
        json['constraints'] as Map<String, dynamic>?,
      ),
      clipBehavior:
          $enumDecodeNullable(_$ClipEnumMap, json['clipBehavior']) ?? Clip.none,
    );

Map<String, dynamic> _$FluxContainerConfigToJson(
  _FluxContainerConfig instance,
) => <String, dynamic>{
  'width': instance.width,
  'height': instance.height,
  'padding': const EdgeInsetsDirectionalConverter().toJson(instance.padding),
  'margin': const EdgeInsetsDirectionalConverter().toJson(instance.margin),
  'decoration': const DecorationConverter().toJson(instance.decoration),
  'alignment': const AlignmentDirectionalConverter().toJson(instance.alignment),
  'constraints': const ConstraintsConverter().toJson(instance.constraints),
  'clipBehavior': _$ClipEnumMap[instance.clipBehavior]!,
};

const _$ClipEnumMap = {
  Clip.none: 'none',
  Clip.hardEdge: 'hardEdge',
  Clip.antiAlias: 'antiAlias',
  Clip.antiAliasWithSaveLayer: 'antiAliasWithSaveLayer',
};
