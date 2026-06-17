// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tile_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTileConfig _$UserTileConfigFromJson(Map<String, dynamic> json) =>
    _UserTileConfig(
      name: json['name'] as String? ?? '',
      nameStyleConfig: json['nameStyleConfig'] == null
          ? null
          : FluxTextStyleConfig.fromJson(
              json['nameStyleConfig'] as Map<String, dynamic>,
            ),
      subtitle: json['subtitle'] as String?,
      subtitleStyleConfig: json['subtitleStyleConfig'] == null
          ? null
          : FluxTextStyleConfig.fromJson(
              json['subtitleStyleConfig'] as Map<String, dynamic>,
            ),
      avatarUrl: json['avatarUrl'] as String?,
      avatarStyleConfig: json['avatarStyleConfig'] == null
          ? null
          : FluxImageStyleConfig.fromJson(
              json['avatarStyleConfig'] as Map<String, dynamic>,
            ),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingStyleConfig: json['ratingStyleConfig'] == null
          ? null
          : FluxRatingStyleConfig.fromJson(
              json['ratingStyleConfig'] as Map<String, dynamic>,
            ),
      contentPadding: const EdgeInsetsDirectionalConverter().fromJson(
        json['contentPadding'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$UserTileConfigToJson(_UserTileConfig instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameStyleConfig': instance.nameStyleConfig?.toJson(),
      'subtitle': instance.subtitle,
      'subtitleStyleConfig': instance.subtitleStyleConfig?.toJson(),
      'avatarUrl': instance.avatarUrl,
      'avatarStyleConfig': instance.avatarStyleConfig?.toJson(),
      'rating': instance.rating,
      'ratingStyleConfig': instance.ratingStyleConfig?.toJson(),
      'contentPadding': const EdgeInsetsDirectionalConverter().toJson(
        instance.contentPadding,
      ),
    };
