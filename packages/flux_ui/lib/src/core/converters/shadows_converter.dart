import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_converter.dart';

class ShadowsConverter
    implements JsonConverter<List<Shadow>?, List<Map<String, dynamic>>?> {
  const ShadowsConverter();

  static const _colorConverter = ColorConverter();

  @override
  List<Shadow>? fromJson(List<Map<String, dynamic>>? json) {
    if (json == null) return null;

    return json.map((map) {
      return Shadow(
        color: _colorConverter.fromJson(map['color']) ?? Colors.black,
        offset: map['offset'] != null
            ? Offset(
                (map['offset']['dx'] as num?)?.toDouble() ?? 0.0,
                (map['offset']['dy'] as num?)?.toDouble() ?? 0.0,
              )
            : Offset.zero,
        blurRadius: (map['blurRadius'] as num?)?.toDouble() ?? 0.0,
      );
    }).toList();
  }

  @override
  List<Map<String, dynamic>>? toJson(List<Shadow>? shadows) {
    if (shadows == null) return null;

    return shadows
        .map(
          (shadow) => {
            'color': const ColorConverter().toJson(shadow.color),
            'offset': {'dx': shadow.offset.dx, 'dy': shadow.offset.dy},
            'blurRadius': shadow.blurRadius,
          },
        )
        .toList();
  }
}
