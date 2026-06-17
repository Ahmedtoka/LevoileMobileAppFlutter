import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters/converters.dart';
import '../flux_config/flux_image_config.dart';
import '../flux_config/text/flux_text_config.dart';
import '../rating_style_config.dart';

part 'user_tile_config.freezed.dart';
part 'user_tile_config.g.dart';

@freezed
abstract class UserTileConfig with _$UserTileConfig {
  const factory UserTileConfig({
    /// The name.
    @Default('') String name,

    /// The name style configuration.
    FluxTextStyleConfig? nameStyleConfig,

    /// The subtitle.
    String? subtitle,

    /// The subtitle style configuration.
    FluxTextStyleConfig? subtitleStyleConfig,

    /// The avatar image URL.
    String? avatarUrl,

    /// The avatar image style configuration.
    FluxImageStyleConfig? avatarStyleConfig,

    /// The rating value.
    double? rating,

    /// The rating style configuration.
    FluxRatingStyleConfig? ratingStyleConfig,

    /// The content padding.
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? contentPadding,
  }) = _UserTileConfig;

  const UserTileConfig._();

  FluxRatingStyleConfig get resolvedRatingStyleConfig =>
      ratingStyleConfig ?? const FluxRatingStyleConfig();

  factory UserTileConfig.fromJson(Map<String, dynamic> json) =>
      _$UserTileConfigFromJson(json);
}
