import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/core.dart';

part 'flux_image_config.freezed.dart';
part 'flux_image_config.g.dart';

@freezed
abstract class FluxImageConfig with _$FluxImageConfig {
  const factory FluxImageConfig({
    @Default('') String url,
    FluxImageStyleConfig? styleConfig,
  }) = _FluxImageConfig;

  factory FluxImageConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxImageConfigFromJson(json);
}

@freezed
abstract class FluxImageStyleConfig with _$FluxImageStyleConfig {
  const factory FluxImageStyleConfig({
    double? width,
    double? height,
    double? aspectRatio,
    @BorderRadiusDirectionalConverter() BorderRadiusDirectional? borderRadius,
    @BoxFitConverter() BoxFit? fit,
    @ColorConverter() Color? color,
    @AlignmentDirectionalConverter() AlignmentDirectional? alignment,
  }) = _FluxImageStyleConfig;

  const FluxImageStyleConfig._();

  factory FluxImageStyleConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxImageStyleConfigFromJson(json);

  double? get resolvedWidth => aspectRatio != null ? null : width;

  double? get resolvedHeight => aspectRatio != null ? null : height;
}
