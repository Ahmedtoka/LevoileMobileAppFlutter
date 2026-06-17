import 'package:freezed_annotation/freezed_annotation.dart';

import 'entities.dart';

part 'menu_list_item_config.freezed.dart';
part 'menu_list_item_config.g.dart';

@freezed
abstract class MenuListItemStyle with _$MenuListItemStyle {
  const factory MenuListItemStyle({
    @Default(FluxCardConfig()) FluxCardConfig cardConfig,
    FluxImageStyleConfig? imageStyleConfig,
    FluxTextStyleConfig? titleStyleConfig,
  }) = _MenuListItemStyle;

  factory MenuListItemStyle.fromJson(Map<String, dynamic> json) =>
      _$MenuListItemStyleFromJson(json);
}

@freezed
abstract class MenuListItemConfig with _$MenuListItemConfig {
  const factory MenuListItemConfig({
    @Default('') String title,
    String? imageUrl,
    MenuListItemStyle? style,
    Map<String, dynamic>? action,
  }) = _MenuListItemConfig;

  const MenuListItemConfig._();

  factory MenuListItemConfig.fromJson(Map<String, dynamic> json) =>
      _$MenuListItemConfigFromJson(json);

  MenuListItemStyle get resolvedStyle => style ?? const MenuListItemStyle();
}
