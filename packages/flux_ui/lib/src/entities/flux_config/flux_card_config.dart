import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters/converters.dart';

part 'flux_card_config.freezed.dart';
part 'flux_card_config.g.dart';

@freezed
abstract class FluxCardConfig with _$FluxCardConfig {
  const factory FluxCardConfig({
    @ColorConverter() Color? color,
    @ColorConverter() Color? shadowColor,
    @ColorConverter() Color? surfaceTintColor,
    double? elevation,
    @BorderRadiusDirectionalConverter()
    @Default(BorderRadiusDirectional.zero)
    BorderRadiusDirectional borderRadius,
    @BorderSideConverter() @Default(BorderSide.none) BorderSide borderSide,
    @ClipConverter() Clip? clipBehavior,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding,
  }) = _FluxCardConfig;

  factory FluxCardConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxCardConfigFromJson(json);
}
