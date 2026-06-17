import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

extension TextOverflowExtension on TextOverflow {
  static TextOverflow? tryParse(String? value) {
    return TextOverflow.values.firstWhereOrNull((e) => e.name == value);
  }
}
