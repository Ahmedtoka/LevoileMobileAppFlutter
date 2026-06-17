// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seo_meta_robot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeoMetaRobot _$SeoMetaRobotFromJson(Map<String, dynamic> json) =>
    _SeoMetaRobot(
      name: $enumDecode(
        _$SeoRobotsNameEnumMap,
        _readValueRobotsName(json, 'name'),
      ),
      content: json['content'] as String,
    );

Map<String, dynamic> _$SeoMetaRobotToJson(_SeoMetaRobot instance) =>
    <String, dynamic>{
      'name': _$SeoRobotsNameEnumMap[instance.name]!,
      'content': instance.content,
    };

const _$SeoRobotsNameEnumMap = {
  SeoRobotsName.robots: 'robots',
  SeoRobotsName.google: 'google',
  SeoRobotsName.googleBot: 'googleBot',
  SeoRobotsName.googleBotNews: 'googleBotNews',
  SeoRobotsName.googleSiteVerification: 'googleSiteVerification',
};
