// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seo_meta_twitter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeoMetaTwitter _$SeoMetaTwitterFromJson(Map<String, dynamic> json) =>
    _SeoMetaTwitter(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      card: $enumDecode(
        _$SeoTwitterCardEnumMap,
        _readValueSeoTwitterCard(json, 'card'),
      ),
    );

Map<String, dynamic> _$SeoMetaTwitterToJson(_SeoMetaTwitter instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'card': _$SeoTwitterCardEnumMap[instance.card]!,
    };

const _$SeoTwitterCardEnumMap = {
  SeoTwitterCard.summary: 'summary',
  SeoTwitterCard.summaryLargeImage: 'summaryLargeImage',
  SeoTwitterCard.app: 'app',
  SeoTwitterCard.player: 'player',
};
