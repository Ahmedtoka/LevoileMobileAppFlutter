import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_converter.dart';

/// A JSON converter for [BorderSide] that handles border configurations including
/// color, width, and style properties.
///
/// This converter supports multiple formats:
/// 1. Default BorderSide (null input)
/// 2. Simple width-only configuration
/// 3. Width and color configuration
/// 4. Full configuration with style
///
/// Example usage with default border:
/// ```dart
/// // Serialization
/// final json = BorderSideConverter().toJson(BorderSide.none);
/// print(json); // null
///
/// // Deserialization
/// final borderSide = BorderSideConverter().fromJson(null);
/// print(borderSide); // BorderSide.none
/// ```
///
/// Example usage with full configuration:
/// ```dart
/// // Serialization
/// final json = BorderSideConverter().toJson(
///   BorderSide(color: Colors.red, width: 2.0, style: BorderStyle.solid)
/// );
/// print(json); // {'color': '#FF0000', 'width': 2.0}
///
/// // Deserialization
/// final borderSide = BorderSideConverter().fromJson({
///   'color': '#FF0000',
///   'width': 2.0,
///   'style': 'solid'
/// });
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Default border (none)
/// null
///
/// // Width-only configuration
/// {
///   "width": 1.0              // Uses default black color and solid style
/// }
///
/// // Width and color configuration
/// {
///   "width": 2.0,
///   "color": "#FF0000"        // Color in hex format
/// }
///
/// // Full configuration
/// {
///   "color": "#FF0000",       // Color in hex format
///   "width": 2.0,             // Border width (double)
///   "style": "solid"          // Border style: "solid" or "none"
/// }
/// ```
///
/// Supported properties:
/// * 'color': Hex color string (e.g., "#FF0000") or null (defaults to black)
/// * 'width': Double value for border width (defaults to 1.0)
/// * 'style': String value - "solid" or "none" (defaults to "solid")
///
/// Note:
/// - If null is provided during deserialization, returns [BorderSide.none]
/// - When serializing, style is only included if it's not [BorderStyle.solid]
/// - Color defaults to black if not specified
/// - Width defaults to 1.0 if not specified
/// - Style defaults to solid if not specified
class BorderSideConverter
    implements JsonConverter<BorderSide, Map<String, dynamic>?> {
  const BorderSideConverter();

  static const _colorConverter = ColorConverter();

  @override
  BorderSide fromJson(Map<String, dynamic>? json) {
    if (json == null) return BorderSide.none;

    // Handle style
    var style = BorderStyle.solid;
    if (json['style'] != null) {
      switch (json['style'].toString().toLowerCase()) {
        case 'none':
          style = BorderStyle.none;
          break;
        case 'solid':
          style = BorderStyle.solid;
          break;
      }
    }

    return BorderSide(
      color: _colorConverter.fromJson(json['color']) ?? Colors.black,
      width: (json['width'] as num?)?.toDouble() ?? 1.0,
      style: style,
    );
  }

  @override
  Map<String, dynamic>? toJson(BorderSide? borderSide) {
    if (borderSide == null) return null;

    return {
      'color': _colorConverter.toJson(borderSide.color),
      'width': borderSide.width,
      if (borderSide.style != BorderStyle.solid)
        'style': borderSide.style == BorderStyle.none ? 'none' : 'solid',
    };
  }
}
