import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/core.dart';

part 'flux_container_config.freezed.dart';
part 'flux_container_config.g.dart';

@freezed
abstract class FluxContainerConfig with _$FluxContainerConfig {
  const FluxContainerConfig._();

  const factory FluxContainerConfig({
    double? width,
    double? height,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,
    @DecorationConverter() BoxDecoration? decoration,
    @AlignmentDirectionalConverter() AlignmentDirectional? alignment,
    @ConstraintsConverter() BoxConstraints? constraints,
    @Default(Clip.none) @ClipConverter() Clip clipBehavior,
  }) = _FluxContainerConfig;

  BoxConstraints? get resolvedConstraints {
    final value = constraints;
    if (value == null) {
      return value;
    }
    final maxWidth = value.maxWidth;
    final maxHeight = value.maxHeight;
    return BoxConstraints(
      minWidth: maxWidth < value.minWidth ? maxWidth : value.minWidth,
      minHeight: maxHeight < value.minHeight ? maxHeight : value.minHeight,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  factory FluxContainerConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxContainerConfigFromJson(json);
}
