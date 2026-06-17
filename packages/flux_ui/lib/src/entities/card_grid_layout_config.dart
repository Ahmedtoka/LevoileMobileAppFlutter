import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'card_grid_item_config.dart';
import 'flux_config/flux_grid_view_config.dart';

part 'card_grid_layout_config.freezed.dart';
part 'card_grid_layout_config.g.dart';

@freezed
abstract class CardGridLayoutConfig with _$CardGridLayoutConfig {
  const factory CardGridLayoutConfig({
    @Default(FluxGridViewConfig()) FluxGridViewConfig gridConfig,
    required List<CardGridItemConfig> items,
    @Default(0) double borderRadius,
  }) = _CardGridLayoutConfig;

  factory CardGridLayoutConfig.fromJson(Map<String, dynamic> json) =>
      _$CardGridLayoutConfigFromJson(json);
}
