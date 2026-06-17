import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'flux_edge_insets_config.dart';

export 'flux_edge_insets_config.dart';

part 'flux_spacing_config.freezed.dart';
part 'flux_spacing_config.g.dart';

@freezed
abstract class FluxSpacingConfig with _$FluxSpacingConfig {
  const factory FluxSpacingConfig({
    @JsonKey(name: 'margin') FluxEdgeInsetsConfig? marginConfig,
    @JsonKey(name: 'padding') FluxEdgeInsetsConfig? paddingConfig,
  }) = _FluxSpacingConfig;

  factory FluxSpacingConfig.fromJson(Map<String, dynamic> json) =>
      _$FluxSpacingConfigFromJson(json);

  static FluxSpacingConfig get zero => FluxSpacingConfig(
    marginConfig: FluxEdgeInsetsConfig.zero,
    paddingConfig: FluxEdgeInsetsConfig.zero,
  );
}
