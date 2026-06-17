// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_view_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeaderViewConfig _$HeaderViewConfigFromJson(Map<String, dynamic> json) =>
    _HeaderViewConfig(
      margin: const EdgeInsetsDirectionalConverter().fromJson(
        json['margin'] as Map<String, dynamic>?,
      ),
      padding: const EdgeInsetsDirectionalConverter().fromJson(
        json['padding'] as Map<String, dynamic>?,
      ),
      title: json['title'] as String,
      actionTitle: json['actionTitle'] as String?,
      action: json['action'] as Map<String, dynamic>?,
      datetimeCountdown: const DateTimeConverter().fromJson(
        json['datetimeCountdown'] as String?,
      ),
    );

Map<String, dynamic> _$HeaderViewConfigToJson(
  _HeaderViewConfig instance,
) => <String, dynamic>{
  'margin': const EdgeInsetsDirectionalConverter().toJson(instance.margin),
  'padding': const EdgeInsetsDirectionalConverter().toJson(instance.padding),
  'title': instance.title,
  'actionTitle': instance.actionTitle,
  'action': instance.action,
  'datetimeCountdown': const DateTimeConverter().toJson(
    instance.datetimeCountdown,
  ),
};
