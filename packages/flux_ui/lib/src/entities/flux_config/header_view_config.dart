import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters/datetime_converter.dart';
import '../../core/converters/edge_insets_directional_converter.dart';

part 'header_view_config.freezed.dart';
part 'header_view_config.g.dart';

@freezed
abstract class HeaderViewConfig with _$HeaderViewConfig {
  const factory HeaderViewConfig({
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? margin,
    @EdgeInsetsDirectionalConverter() EdgeInsetsDirectional? padding,
    required String title,
    String? actionTitle,
    Map<String, dynamic>? action,
    @DateTimeConverter() DateTime? datetimeCountdown,
  }) = _HeaderViewConfig;

  factory HeaderViewConfig.fromJson(Map<String, dynamic> json) =>
      _$HeaderViewConfigFromJson(json);
}
