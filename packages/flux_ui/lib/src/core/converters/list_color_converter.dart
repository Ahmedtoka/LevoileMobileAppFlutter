import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_converter.dart';

class ListColorConverter
    implements JsonConverter<List<Color>?, List<dynamic>?> {
  const ListColorConverter();

  static const _colorConverter = ColorConverter();

  @override
  List<Color>? fromJson(List<dynamic>? json) {
    if (json == null) return null;
    return json
        .map((e) => _colorConverter.fromJson(e))
        .whereType<Color>()
        .toList();
  }

  @override
  List<dynamic>? toJson(List<Color?>? colors) {
    if (colors == null) return null;
    return colors.map((c) => _colorConverter.toJson(c)).toList();
  }
}
