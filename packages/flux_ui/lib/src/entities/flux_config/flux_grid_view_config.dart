import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters/converters.dart';

part 'flux_grid_view_config.freezed.dart';
part 'flux_grid_view_config.g.dart';

const _defaultCrossAxisCount = 2;
const _defaultCrossAxisSpacing = 8.0;
const _defaultMainAxisSpacing = 8.0;
const _defaultChildAspectRatio = 16 / 9;

@freezed
abstract class FluxGridViewConfig with _$FluxGridViewConfig {
  const factory FluxGridViewConfig({
    @Default(_defaultCrossAxisCount) int crossAxisCount,
    @Default(_defaultCrossAxisSpacing) double crossAxisSpacing,
    @Default(_defaultMainAxisSpacing) double mainAxisSpacing,
    @Default(_defaultChildAspectRatio) double childAspectRatio,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,
  }) = _FluxGridViewConfig;

  factory FluxGridViewConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxGridViewConfigFromJson(json);
}
