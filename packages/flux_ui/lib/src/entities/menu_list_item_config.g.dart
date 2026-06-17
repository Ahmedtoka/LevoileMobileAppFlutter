// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list_item_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuListItemStyle _$MenuListItemStyleFromJson(Map<String, dynamic> json) =>
    _MenuListItemStyle(
      cardConfig: json['cardConfig'] == null
          ? const FluxCardConfig()
          : FluxCardConfig.fromJson(json['cardConfig'] as Map<String, dynamic>),
      imageStyleConfig: json['imageStyleConfig'] == null
          ? null
          : FluxImageStyleConfig.fromJson(
              json['imageStyleConfig'] as Map<String, dynamic>,
            ),
      titleStyleConfig: json['titleStyleConfig'] == null
          ? null
          : FluxTextStyleConfig.fromJson(
              json['titleStyleConfig'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MenuListItemStyleToJson(_MenuListItemStyle instance) =>
    <String, dynamic>{
      'cardConfig': instance.cardConfig.toJson(),
      'imageStyleConfig': instance.imageStyleConfig?.toJson(),
      'titleStyleConfig': instance.titleStyleConfig?.toJson(),
    };

_MenuListItemConfig _$MenuListItemConfigFromJson(Map<String, dynamic> json) =>
    _MenuListItemConfig(
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      style: json['style'] == null
          ? null
          : MenuListItemStyle.fromJson(json['style'] as Map<String, dynamic>),
      action: json['action'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MenuListItemConfigToJson(_MenuListItemConfig instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'style': instance.style?.toJson(),
      'action': instance.action,
    };
