import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_converter.dart';

/// A JSON converter for [BoxShadow] that handles serialization and deserialization
/// of shadow properties.
///
/// This converter supports converting between [BoxShadow] objects and JSON maps,
/// handling all shadow properties including color, offset, blur radius, and spread radius.
///
/// Example usage:
/// ```dart
/// // Serialization
/// final boxShadow = BoxShadow(
///   color: Colors.black.withValueOpacity(0.12),
///   offset: const Offset(0, 3),
///   blurRadius: 6,
///   spreadRadius: 0,
/// );
/// final json = BoxShadowConverter().toJson(boxShadow);
/// print(json); // {'color': '#1F000000', 'offset': {'dx': 0, 'dy': 3}, ...}
///
/// // Deserialization
/// final shadow = BoxShadowConverter().fromJson({
///   'color': '#20000000',
///   'offset': {'dx': 0.0, 'dy': 3.0},
///   'blurRadius': 6.0,
///   'spreadRadius': 0.0,
/// });
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Complete shadow definition
/// {
///   "color": "#FF000000",        // Color in hex format (ARGB)
///   "offset": {
///     "dx": 0.0,                 // Horizontal offset
///     "dy": 2.0                  // Vertical offset
///   },
///   "blurRadius": 4.0,          // Blur radius of the shadow
///   "spreadRadius": 0.0         // Spread radius of the shadow
/// }
///
/// // Minimal shadow definition (uses defaults)
/// {
///   "color": "#FF000000"        // Only color specified, other values default
/// }
///
/// // Null value
/// null                         // Results in null shadow
/// ```
///
/// Default values when properties are missing:
/// * color: [Colors.black] (if color is missing or invalid)
/// * offset: [Offset.zero] (if offset is missing)
/// * blurRadius: 0.0 (if blur radius is missing)
/// * spreadRadius: 0.0 (if spread radius is missing)
///
/// Note:
/// - Color values should be provided in hex format (#AARRGGBB)
/// - Offset coordinates (dx, dy) can be positive or negative
/// - Blur and spread radius values should be non-negative
/// - All numeric values are parsed as doubles
class BoxShadowConverter
    implements JsonConverter<BoxShadow?, Map<String, dynamic>?> {
  const BoxShadowConverter();

  static const _colorConverter = ColorConverter();

  @override
  BoxShadow? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return BoxShadow(
      color: _colorConverter.fromJson(json['color']) ?? Colors.black,
      offset: json['offset'] != null
          ? Offset(
              (json['offset']['dx'] as num?)?.toDouble() ?? 0.0,
              (json['offset']['dy'] as num?)?.toDouble() ?? 0.0,
            )
          : Offset.zero,
      blurRadius: (json['blurRadius'] as num?)?.toDouble() ?? 0.0,
      spreadRadius: (json['spreadRadius'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  Map<String, dynamic>? toJson(BoxShadow? shadow) {
    if (shadow == null) return null;

    return {
      'color': _colorConverter.toJson(shadow.color),
      'offset': {'dx': shadow.offset.dx, 'dy': shadow.offset.dy},
      'blurRadius': shadow.blurRadius,
      'spreadRadius': shadow.spreadRadius,
    };
  }
}
