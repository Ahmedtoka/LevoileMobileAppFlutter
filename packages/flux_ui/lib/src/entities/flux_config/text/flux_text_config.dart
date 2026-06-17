import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app/app_text_style.dart';
import '../flux_container_config.dart';
import 'text_style_source.dart';

part 'flux_text_config.freezed.dart';
part 'flux_text_config.g.dart';

@freezed
abstract class FluxTextConfig with _$FluxTextConfig {
  const factory FluxTextConfig({
    @Default('') String text,
    FluxTextStyleConfig? styleConfig,
  }) = _FluxTextConfig;

  factory FluxTextConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxTextConfigFromJson(json);
}

@freezed
abstract class FluxTextStyleConfig with _$FluxTextStyleConfig {
  const factory FluxTextStyleConfig({
    TextStyleSource? styleSource,
    AppTextStyle? customStyle,
    TextOverflow? textOverflow,
    int? maxLines,
    int? minLines,
    TextAlign? textAlign,
    FluxContainerConfig? containerConfig,
  }) = _FluxTextStyleConfig;

  factory FluxTextStyleConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxTextStyleConfigFromJson(json);
}
