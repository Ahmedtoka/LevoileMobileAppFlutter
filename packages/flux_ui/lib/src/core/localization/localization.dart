import 'package:flutter/material.dart';

import 'flux_ui_localization.dart';
import 'translate.dart';

class F {
  static final F _instance = F._internal();

  factory F() => _instance;

  F._internal();

  static FluxUILocalization of(BuildContext context) {
    return ofStatic(context);
  }

  static FluxUILocalization Function(BuildContext context) ofStatic =
      (context) => FluxUiImplementationLocalization(context);
}
