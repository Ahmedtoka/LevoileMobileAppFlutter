// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_seo_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaSeoApp _$MetaSeoAppFromJson(Map<String, dynamic> json) => _MetaSeoApp(
  excludes: (json['excludes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  config: SeoConfig.fromJson(json['config'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetaSeoAppToJson(_MetaSeoApp instance) =>
    <String, dynamic>{
      'excludes': instance.excludes,
      'config': instance.config.toJson(),
    };
