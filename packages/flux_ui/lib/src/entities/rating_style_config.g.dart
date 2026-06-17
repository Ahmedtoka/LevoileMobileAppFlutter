// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_style_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FluxRatingStyleConfig _$FluxRatingStyleConfigFromJson(
  Map<String, dynamic> json,
) => _FluxRatingStyleConfig(
  size: (json['size'] as num?)?.toDouble() ?? 16,
  color: json['color'] == null
      ? AppColor.primary
      : AppColor.fromJson(json['color'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FluxRatingStyleConfigToJson(
  _FluxRatingStyleConfig instance,
) => <String, dynamic>{'size': instance.size, 'color': instance.color.toJson()};
