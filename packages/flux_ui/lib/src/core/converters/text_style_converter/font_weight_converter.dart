import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class FontWeightConverter implements JsonConverter<FontWeight?, String?> {
  const FontWeightConverter();

  @override
  FontWeight? fromJson(String? json) {
    if (json == null) return null;
    switch (json) {
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  @override
  String? toJson(FontWeight? weight) {
    if (weight == null) return null;
    return 'w${(weight.value ~/ 100).clamp(1, 9)}00';
  }
}
