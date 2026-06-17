import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flux_edge_insets_config.freezed.dart';
part 'flux_edge_insets_config.g.dart';

@freezed
abstract class FluxEdgeInsetsConfig with _$FluxEdgeInsetsConfig {
  const factory FluxEdgeInsetsConfig({
    @JsonKey(name: 'start', readValue: _EdgeConfigHelper.parseOldConfig)
    @Default(0)
    double start,
    @JsonKey(name: 'end', readValue: _EdgeConfigHelper.parseOldConfig)
    @Default(0)
    double end,
    @Default(0) double top,
    @Default(0) double bottom,
  }) = _FluxEdgeInsetsConfig;

  factory FluxEdgeInsetsConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxEdgeInsetsConfigFromJson(json);

  static FluxEdgeInsetsConfig get zero =>
      const FluxEdgeInsetsConfig(start: 0.0, end: 0.0, top: 0.0, bottom: 0.0);
}

class _EdgeConfigHelper {
  /// Support load the old config data.
  static dynamic parseOldConfig(Map json, String key) {
    if (key == 'start') {
      return json['start'] ?? json['left'];
    } else if (key == 'end') {
      return json['end'] ?? json['right'];
    }

    return json[key];
  }
}
