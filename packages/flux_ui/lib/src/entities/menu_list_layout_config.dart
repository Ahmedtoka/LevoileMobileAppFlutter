import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/converters/converters.dart';
import 'menu_list_item_config.dart';

part 'menu_list_layout_config.freezed.dart';
part 'menu_list_layout_config.g.dart';

@freezed
abstract class MenuListLayoutConfig with _$MenuListLayoutConfig {
  const factory MenuListLayoutConfig({
    required List<MenuListItemConfig> items,
    @Default(8) double itemSpacing,
    double? itemHeight,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,
    @Default(MenuListItemStyle()) MenuListItemStyle style,
  }) = _MenuListLayoutConfig;

  const MenuListLayoutConfig._();

  factory MenuListLayoutConfig.fromJson(Map<String, dynamic> json) =>
      _$MenuListLayoutConfigFromJson(json);

  MenuListItemStyle get resolvedStyle {
    if (itemHeight == null) {
      return style.copyWith(
        imageStyleConfig: style.imageStyleConfig?.copyWith(aspectRatio: null),
      );
    }
    return style;
  }

  List<MenuListItemConfig> get resolvedItems => items.map((e) {
    final style = e.style;
    if (style == null) {
      return e.copyWith(style: resolvedStyle);
    }
    if (itemHeight == null) {
      return e.copyWith(
        style: style.copyWith(
          imageStyleConfig: style.imageStyleConfig?.copyWith(aspectRatio: null),
        ),
      );
    }
    return e;
  }).toList();
}
