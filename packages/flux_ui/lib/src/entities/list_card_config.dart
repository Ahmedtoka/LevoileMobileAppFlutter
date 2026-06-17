import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/converters/axis_converter.dart';
import '../core/converters/divider_convert.dart';
import '../core/converters/edge_insets_directional_converter.dart';
import 'enums/list_card_style.dart';
import 'item_list_card_config.dart';

part 'list_card_config.freezed.dart';
part 'list_card_config.g.dart';

@freezed
abstract class ListCardConfig with _$ListCardConfig {
  const factory ListCardConfig({
    // Height for content, image and action
    double? heightContent,
    double? heightImage,
    double? heightAction,

    // Config for title and subtitle
    TextItemConfig? titleTextConfig,
    TextItemConfig? subtitleTextConfig,

    // action config
    StyleItemCardConfig? actionBoxStyle,
    TextItemConfig? actionTextConfig,

    // tag config
    StyleItemCardConfig? tagBoxStyle,
    TextItemConfig? tagTextConfig,

    // widget config
    StyleItemCardConfig? cardBoxStyle,
    List<ItemListCardConfig>? items,
    @AxisConverter() Axis? axis,

    /// only support border, border radius, margin and padding
    StyleItemCardConfig? imageBoxStyle,

    // Padding for content
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding,
    // Padding for card
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,

    // Style for list card
    @Default(ListCardStyle.titleHeading) ListCardStyle style,

    /// Number of item in line. Only support for horizontal
    /// Min 1, Max 3
    double? itemInLine,

    ///  Spacing for item
    double? itemSpacing,
    @DividerConverter() Divider? divider,
  }) = _ListCardConfig;

  factory ListCardConfig.fromJson(Map<String, dynamic> json) =>
      _$ListCardConfigFromJson(json);
}
