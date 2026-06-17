import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspireui/inspireui.dart';

class DividerConverter
    implements JsonConverter<Divider?, Map<String, dynamic>?> {
  const DividerConverter();

  @override
  Divider? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Divider(
      color: json['color'] != null ? HexColor(json['color']) : null,
      thickness: num.tryParse(json['thickness'].toString())?.toDouble() ?? 1,
      indent: num.tryParse(json['indent'].toString())?.toDouble() ?? 0,
      endIndent: num.tryParse(json['endIndent'].toString())?.toDouble() ?? 0,
      height: num.tryParse(json['height'].toString())?.toDouble() ?? 0,
    );
  }

  @override
  Map<String, dynamic>? toJson(Divider? divider) {
    if (divider == null) return null;

    return {
      'color': divider.color?.valueNum.toRadixString(16),
      'thickness': divider.thickness,
      'indent': divider.indent,
      'endIndent': divider.endIndent,
      'height': divider.height,
    };
  }
}
