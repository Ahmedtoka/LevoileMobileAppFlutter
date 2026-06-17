// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flux_grid_view_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxGridViewConfig _$FluxGridViewConfigFromJson(Map<String, dynamic> json) =>
    _FluxGridViewConfig(
      crossAxisCount:
          (json['crossAxisCount'] as num?)?.toInt() ?? _defaultCrossAxisCount,
      crossAxisSpacing:
          (json['crossAxisSpacing'] as num?)?.toDouble() ??
          _defaultCrossAxisSpacing,
      mainAxisSpacing:
          (json['mainAxisSpacing'] as num?)?.toDouble() ??
          _defaultMainAxisSpacing,
      childAspectRatio:
          (json['childAspectRatio'] as num?)?.toDouble() ??
          _defaultChildAspectRatio,
      padding: const EdgeInsetsDirectionalConverter().fromJson(
        json['padding'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$FluxGridViewConfigToJson(
  _FluxGridViewConfig instance,
) => <String, dynamic>{
  'crossAxisCount': instance.crossAxisCount,
  'crossAxisSpacing': instance.crossAxisSpacing,
  'mainAxisSpacing': instance.mainAxisSpacing,
  'childAspectRatio': instance.childAspectRatio,
  'padding': const EdgeInsetsDirectionalConverter().toJson(instance.padding),
};
