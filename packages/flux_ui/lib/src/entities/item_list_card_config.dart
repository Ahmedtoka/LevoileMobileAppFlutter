import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/converters/converters.dart';

part 'item_list_card_config.freezed.dart';
part 'item_list_card_config.g.dart';

@freezed
abstract class ItemListCardConfig with _$ItemListCardConfig {
  const factory ItemListCardConfig({
    @StringConverter() required String title,
    required String? subtitle,
    @StringConverter() required String imageUrl,
    ActionItemCardConfig? action,
    List<String>? tags,
  }) = _ItemListCardConfig;

  factory ItemListCardConfig.fromJson(Map<String, dynamic> json) =>
      _$ItemListCardConfigFromJson(json);
}

@freezed
abstract class ActionItemCardConfig with _$ActionItemCardConfig {
  const factory ActionItemCardConfig({
    String? title,
    required Map<String, dynamic> action,
    @AlignmentDirectionalConverter() AlignmentDirectional? alignment,
  }) = _ActionItemCardConfig;

  factory ActionItemCardConfig.fromJson(Map<String, dynamic> json) =>
      _$ActionItemCardConfigFromJson(json);
}

@freezed
abstract class StyleItemCardConfig with _$StyleItemCardConfig {
  const factory StyleItemCardConfig({
    @DecorationConverter() BoxDecoration? decoration,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,
  }) = _StyleItemCardConfig;

  factory StyleItemCardConfig.fromJson(Map<String, dynamic> json) =>
      _$StyleItemCardConfigFromJson(json);
}

@freezed
abstract class TextItemConfig with _$TextItemConfig {
  const factory TextItemConfig({
    int? maxLines,
    @TextStyleConverter() TextStyle? style,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,
  }) = _TextItemConfig;

  factory TextItemConfig.fromJson(Map<String, dynamic> json) =>
      _$TextItemConfigFromJson(json);
}
