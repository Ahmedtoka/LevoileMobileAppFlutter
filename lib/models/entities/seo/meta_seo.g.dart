// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_seo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetaSeoConfig _$MetaSeoConfigFromJson(Map<String, dynamic> json) =>
    _MetaSeoConfig(
      app: json['app'] == null
          ? null
          : MetaSeoApp.fromJson(json['app'] as Map<String, dynamic>),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => MetaSeoRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MetaSeoConfigToJson(_MetaSeoConfig instance) =>
    <String, dynamic>{
      'app': instance.app?.toJson(),
      'routes': instance.routes?.map((e) => e.toJson()).toList(),
    };
