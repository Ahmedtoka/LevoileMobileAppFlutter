import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'box_shadow_converter.dart';
import 'color_converter.dart';

/// A JSON converter for [BoxDecoration] that handles serialization and deserialization
/// of Flutter's box decoration properties.
///
/// This converter supports four main decoration properties:
/// 1. Color
/// 2. Border radius
/// 3. Border
/// 4. Box shadow
///
/// Example usage with basic decoration:
/// ```dart
/// // Serialization
/// final json = DecorationConverter().toJson(BoxDecoration(
///   color: Colors.blue,
///   borderRadius: BorderRadius.circular(8),
/// ));
/// print(json); // {'color': '#FF2196F3', 'borderRadius': 8.0}
///
/// // Deserialization
/// final decoration = DecorationConverter().fromJson({
///   'color': '#FF2196F3',
///   'borderRadius': 8.0,
/// });
/// ```
///
/// Example usage with complex decoration:
/// ```dart
/// // Serialization
/// final json = DecorationConverter().toJson(BoxDecoration(
///   color: Colors.white,
///   borderRadius: BorderRadius.circular(12),
///   border: Border.all(color: Colors.grey),
///   boxShadow: [
///     BoxShadow(
///       color: Colors.black.withValueOpacity(0.1),
///       blurRadius: 4,
///       offset: Offset(0, 2),
///     ),
///   ],
/// ));
///
/// // Deserialization
/// final decoration = DecorationConverter().fromJson({
///   'color': '#FFFFFFFF',
///   'borderRadius': 12.0,
///   'border': {'color': '#FF9E9E9E', 'width': 1.0},
///   'boxShadow': [{
///     'color': '#1A000000',
///     'blurRadius': 4.0,
///     'offset': {'dx': 0.0, 'dy': 2.0},
///   }],
/// });
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Basic decoration
/// {
///   "color": "#FF2196F3",           // Color in ARGB hex format
///   "borderRadius": 8.0             // Circular border radius
/// }
///
/// // Complex decoration
/// {
///   "color": "#FFFFFFFF",           // Background color
///   "borderRadius": 12.0,           // Border radius
///   "border": {
///     "color": "#FF9E9E9E",        // Border color
///     "width": 1.0                 // Border width
///   },
///   "boxShadow": [{                // List of shadows
///     "color": "#1A000000",        // Shadow color
///     "blurRadius": 4.0,           // Shadow blur
///     "spreadRadius": 0.0,         // Shadow spread
///     "offset": {
///       "dx": 0.0,                // Horizontal offset
///       "dy": 2.0                 // Vertical offset
///     }
///   }]
/// }
///
/// // Null value
/// null                            // Results in null decoration
/// ```
///
/// Supported properties:
/// * color: Any valid color value (hex, rgb, rgba, or named color)
/// * borderRadius: Circular border radius value in logical pixels
/// * border: Border color and width specifications
/// * boxShadow: Single shadow or list of shadows with full shadow properties
///
/// Note:
/// - All properties are optional
/// - Colors can be specified in any format supported by ColorConverter
/// - Border radius is always circular (uniform on all corners)
/// - Border is always uniform (same properties on all sides)
/// - Box shadows can be a single shadow or a list of shadows
/// - Invalid or missing properties are ignored
class DecorationConverter
    implements JsonConverter<BoxDecoration?, Map<String, dynamic>?> {
  const DecorationConverter();

  static const _colorConverter = ColorConverter();
  static const _shadowConverter = BoxShadowConverter();

  @override
  BoxDecoration? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    List<BoxShadow>? parseShadows(dynamic shadowData) {
      if (shadowData == null) return null;
      if (shadowData is List) {
        return shadowData
            .map((shadow) => _shadowConverter.fromJson(shadow))
            .whereType<BoxShadow>()
            .toList();
      }
      final shadow = _shadowConverter.fromJson(shadowData);
      return shadow != null ? [shadow] : null;
    }

    return BoxDecoration(
      color: json['color'] != null
          ? _colorConverter.fromJson(json['color'])
          : null,
      borderRadius: json['borderRadius'] != null
          ? BorderRadius.circular(json['borderRadius'].toDouble())
          : null,
      border: json['border'] != null
          ? Border.all(
              color:
                  _colorConverter.fromJson(json['border']['color']) ??
                  Colors.black,
              width: json['border']['width'].toDouble(),
            )
          : null,
      boxShadow: parseShadows(json['boxShadow']),
    );
  }

  @override
  Map<String, dynamic>? toJson(BoxDecoration? decoration) {
    if (decoration == null) return null;

    return {
      if (decoration.color != null)
        'color': _colorConverter.toJson(decoration.color),
      if (decoration.borderRadius != null)
        'borderRadius': (decoration.borderRadius as BorderRadius?)?.topLeft.x,
      if (decoration.border != null)
        'border': {
          'color': _colorConverter.toJson(
            (decoration.border as Border?)?.top.color,
          ),
          'width': (decoration.border as Border?)?.top.width,
        },
      if (decoration.boxShadow != null)
        'boxShadow': decoration.boxShadow!
            .map((shadow) => _shadowConverter.toJson(shadow))
            .toList(),
    };
  }
}
