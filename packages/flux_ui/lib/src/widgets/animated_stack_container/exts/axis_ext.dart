import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

extension AxisExtension on Axis {
  static Axis fromString(String? value) {
    return Axis.values.firstWhereOrNull((e) => e.name == value) ??
        Axis.horizontal;
  }
}
