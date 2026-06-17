import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

extension BoxFitExtension on BoxFit {
  static BoxFit fromString(String? value) {
    return BoxFit.values.firstWhereOrNull((e) => e.name == value) ??
        BoxFit.cover;
  }
}
