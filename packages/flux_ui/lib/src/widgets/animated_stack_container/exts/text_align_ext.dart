import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

extension TextAlignExtension on TextAlign {
  static TextAlign? tryParse(String? value) {
    return TextAlign.values.firstWhereOrNull((e) => e.name == value);
  }
}
