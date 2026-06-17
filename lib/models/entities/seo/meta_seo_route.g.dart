// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_seo_route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaSeoRoute _$MetaSeoRouteFromJson(Map<String, dynamic> json) =>
    _MetaSeoRoute(
      route: json['route'] as String,
      config: SeoConfig.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaSeoRouteToJson(_MetaSeoRoute instance) =>
    <String, dynamic>{
      'route': instance.route,
      'config': instance.config.toJson(),
    };
