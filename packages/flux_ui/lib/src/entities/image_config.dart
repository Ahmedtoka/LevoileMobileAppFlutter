import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/core.dart';

part 'image_config.freezed.dart';
part 'image_config.g.dart';

const _defaultImageAspectRatio = 1.0;
const _defaultImageBorderRadius = BorderRadiusDirectional.zero;

@freezed
abstract class ImageConfig with _$ImageConfig {
  const factory ImageConfig({
    @Default(_defaultImageAspectRatio) double aspectRatio,
    @ColorConverter() Color? color,
    @BoxFitConverter() BoxFit? fit,
    @BorderRadiusDirectionalConverter()
    @Default(_defaultImageBorderRadius)
    BorderRadiusDirectional borderRadius,
  }) = _ImageConfig;

  factory ImageConfig.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigFromJson(json);
}
