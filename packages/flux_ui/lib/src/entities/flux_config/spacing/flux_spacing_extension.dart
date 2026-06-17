import 'package:flutter/widgets.dart';

import 'flux_spacing_config.dart';

extension FluxSpacingConfigExtension on FluxSpacingConfig {
  EdgeInsetsDirectional? get margin => marginConfig?.toEdgeInsetsDirectional();

  EdgeInsetsDirectional? get padding =>
      paddingConfig?.toEdgeInsetsDirectional();
}

extension FluxSpacingExtension on FluxEdgeInsetsConfig? {
  EdgeInsetsDirectional toEdgeInsetsDirectional() {
    return EdgeInsetsDirectional.only(
      start: this?.start ?? 0.0,
      end: this?.end ?? 0.0,
      top: this?.top ?? 0.0,
      bottom: this?.bottom ?? 0.0,
    );
  }
}
