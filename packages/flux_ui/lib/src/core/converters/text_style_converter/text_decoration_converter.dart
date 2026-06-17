import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TextDecorationConverter
    implements JsonConverter<TextDecoration?, String?> {
  const TextDecorationConverter();

  @override
  TextDecoration? fromJson(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'none':
        return TextDecoration.none;
      case 'underline':
        return TextDecoration.underline;
      case 'overline':
        return TextDecoration.overline;
      case 'linethrough':
        return TextDecoration.lineThrough;
      default:
        return null;
    }
  }

  @override
  String? toJson(TextDecoration? decoration) {
    if (decoration == null) return null;
    if (decoration == TextDecoration.none) return 'none';
    if (decoration == TextDecoration.underline) return 'underline';
    if (decoration == TextDecoration.overline) return 'overline';
    if (decoration == TextDecoration.lineThrough) return 'linethrough';
    return null;
  }
}
