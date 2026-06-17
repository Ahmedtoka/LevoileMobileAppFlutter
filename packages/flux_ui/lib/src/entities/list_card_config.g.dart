// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_card_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListCardConfig _$ListCardConfigFromJson(Map<String, dynamic> json) =>
    _ListCardConfig(
      heightContent: (json['heightContent'] as num?)?.toDouble(),
      heightImage: (json['heightImage'] as num?)?.toDouble(),
      heightAction: (json['heightAction'] as num?)?.toDouble(),
      titleTextConfig: json['titleTextConfig'] == null
          ? null
          : TextItemConfig.fromJson(
              json['titleTextConfig'] as Map<String, dynamic>,
            ),
      subtitleTextConfig: json['subtitleTextConfig'] == null
          ? null
          : TextItemConfig.fromJson(
              json['subtitleTextConfig'] as Map<String, dynamic>,
            ),
      actionBoxStyle: json['actionBoxStyle'] == null
          ? null
          : StyleItemCardConfig.fromJson(
              json['actionBoxStyle'] as Map<String, dynamic>,
            ),
      actionTextConfig: json['actionTextConfig'] == null
          ? null
          : TextItemConfig.fromJson(
              json['actionTextConfig'] as Map<String, dynamic>,
            ),
      tagBoxStyle: json['tagBoxStyle'] == null
          ? null
          : StyleItemCardConfig.fromJson(
              json['tagBoxStyle'] as Map<String, dynamic>,
            ),
      tagTextConfig: json['tagTextConfig'] == null
          ? null
          : TextItemConfig.fromJson(
              json['tagTextConfig'] as Map<String, dynamic>,
            ),
      cardBoxStyle: json['cardBoxStyle'] == null
          ? null
          : StyleItemCardConfig.fromJson(
              json['cardBoxStyle'] as Map<String, dynamic>,
            ),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemListCardConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      axis: const AxisConverter().fromJson(json['axis'] as String?),
      imageBoxStyle: json['imageBoxStyle'] == null
          ? null
          : StyleItemCardConfig.fromJson(
              json['imageBoxStyle'] as Map<String, dynamic>,
            ),
      contentPadding: const EdgeInsetsDirectionalConverter().fromJson(
        json['contentPadding'] as Map<String, dynamic>?,
      ),
      padding: const EdgeInsetsDirectionalConverter().fromJson(
        json['padding'] as Map<String, dynamic>?,
      ),
      style:
          $enumDecodeNullable(_$ListCardStyleEnumMap, json['style']) ??
          ListCardStyle.titleHeading,
      itemInLine: (json['itemInLine'] as num?)?.toDouble(),
      itemSpacing: (json['itemSpacing'] as num?)?.toDouble(),
      divider: const DividerConverter().fromJson(
        json['divider'] as Map<String, dynamic>?,
      ),
    );

Map<String, dynamic> _$ListCardConfigToJson(
  _ListCardConfig instance,
) => <String, dynamic>{
  'heightContent': instance.heightContent,
  'heightImage': instance.heightImage,
  'heightAction': instance.heightAction,
  'titleTextConfig': instance.titleTextConfig?.toJson(),
  'subtitleTextConfig': instance.subtitleTextConfig?.toJson(),
  'actionBoxStyle': instance.actionBoxStyle?.toJson(),
  'actionTextConfig': instance.actionTextConfig?.toJson(),
  'tagBoxStyle': instance.tagBoxStyle?.toJson(),
  'tagTextConfig': instance.tagTextConfig?.toJson(),
  'cardBoxStyle': instance.cardBoxStyle?.toJson(),
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'axis': _$JsonConverterToJson<String?, Axis>(
    instance.axis,
    const AxisConverter().toJson,
  ),
  'imageBoxStyle': instance.imageBoxStyle?.toJson(),
  'contentPadding': const EdgeInsetsDirectionalConverter().toJson(
    instance.contentPadding,
  ),
  'padding': const EdgeInsetsDirectionalConverter().toJson(instance.padding),
  'style': _$ListCardStyleEnumMap[instance.style]!,
  'itemInLine': instance.itemInLine,
  'itemSpacing': instance.itemSpacing,
  'divider': const DividerConverter().toJson(instance.divider),
};

const _$ListCardStyleEnumMap = {
  ListCardStyle.subtitleHeading: 'subtitleHeading',
  ListCardStyle.titleHeading: 'titleHeading',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
