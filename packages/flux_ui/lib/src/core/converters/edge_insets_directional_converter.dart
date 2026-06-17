import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [EdgeInsetsDirectional] that handles different padding formats.
///
/// This converter supports three formats:
/// 1. All-side padding using a single value
/// 2. Symmetric padding with horizontal and vertical values
/// 3. Directional padding with specific values for each side
///
/// Example usage with all-side padding:
/// ```dart
/// // Serialization
/// final json = EdgeInsetsDirectionalConverter().toJson(EdgeInsetsDirectional.all(16));
/// print(json); // {'all': 16.0}
///
/// // Deserialization
/// final padding = EdgeInsetsDirectionalConverter().fromJson({'all': 16.0});
/// print(padding); // EdgeInsetsDirectional.all(16.0)
/// ```
///
/// Example usage with symmetric padding:
/// ```dart
/// // Serialization
/// final json = EdgeInsetsDirectionalConverter()
///     .toJson(EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8));
/// print(json); // {'horizontal': 16.0, 'vertical': 8.0}
///
/// // Deserialization
/// final padding = EdgeInsetsDirectionalConverter()
///     .fromJson({'horizontal': 16.0, 'vertical': 8.0});
/// print(padding); // EdgeInsetsDirectional.symmetric(horizontal: 16.0, vertical: 8.0)
/// ```
///
/// Example usage with directional padding:
/// ```dart
/// // Serialization
/// final json = EdgeInsetsDirectionalConverter()
///     .toJson(EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8));
/// print(json); // {'start': 16.0, 'top': 8.0, 'end': 16.0, 'bottom': 8.0}
///
/// // Deserialization
/// final padding = EdgeInsetsDirectionalConverter()
///     .fromJson({'start': 16.0, 'top': 8.0, 'end': 16.0, 'bottom': 8.0});
/// print(padding); // EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0)
/// ```
///
/// JSON Format Examples:
/// ```json
/// // All-side padding
/// {
///   "all": 16.0           // Same padding for all sides
/// }
///
/// // Symmetric padding
/// {
///   "horizontal": 16.0,   // Start and end padding
///   "vertical": 8.0       // Top and bottom padding
/// }
///
/// // Directional padding
/// {
///   "start": 16.0,       // Start (left in LTR) padding
///   "top": 8.0,          // Top padding
///   "end": 16.0,         // End (right in LTR) padding
///   "bottom": 8.0        // Bottom padding
/// }
///
/// // Null value
/// null                   // Results in null padding
/// ```
///
/// Note:
/// - The converter automatically selects the most concise representation when serializing
/// - If all sides are equal, it uses the 'all' format
/// - If only horizontal and vertical pairs are equal, it uses the symmetric format
/// - Otherwise, it uses the full directional format
/// - Missing values in directional format default to 0.0
/// - When [defaultValue] is provided, it will be returned instead of null when
///   converting from a null JSON value
class EdgeInsetsDirectionalConverter
    implements JsonConverter<EdgeInsetsDirectional?, Map<String, dynamic>?> {
  const EdgeInsetsDirectionalConverter([this.defaultValue]);

  final EdgeInsetsDirectional? defaultValue;

  @override
  EdgeInsetsDirectional? fromJson(Map<String, dynamic>? json) {
    if (json == null) return defaultValue;

    // Handle "all" value case - same padding for all sides
    if (json['all'] != null) {
      final value = num.parse(json['all'].toString()).toDouble();
      return EdgeInsetsDirectional.all(value);
    }

    // Handle symmetric case - horizontal (start/end) and vertical (top/bottom)
    if (json['horizontal'] != null || json['vertical'] != null) {
      return EdgeInsetsDirectional.symmetric(
        horizontal: json['horizontal'] != null
            ? num.parse(json['horizontal'].toString()).toDouble()
            : 0.0,
        vertical: json['vertical'] != null
            ? num.parse(json['vertical'].toString()).toDouble()
            : 0.0,
      );
    }

    // Handle directional case - specific values for each side
    return EdgeInsetsDirectional.fromSTEB(
      json['start'] != null
          ? num.parse(json['start'].toString()).toDouble()
          : 0.0,
      json['top'] != null ? num.parse(json['top'].toString()).toDouble() : 0.0,
      json['end'] != null ? num.parse(json['end'].toString()).toDouble() : 0.0,
      json['bottom'] != null
          ? num.parse(json['bottom'].toString()).toDouble()
          : 0.0,
    );
  }

  @override
  Map<String, dynamic>? toJson(EdgeInsetsDirectional? edgeInsetsDirectional) {
    if (edgeInsetsDirectional == null) return null;

    // Check if it's a symmetric padding (start=end and top=bottom)
    if (edgeInsetsDirectional.start == edgeInsetsDirectional.end &&
        edgeInsetsDirectional.top == edgeInsetsDirectional.bottom) {
      // If all sides are equal, use the "all" format
      if (edgeInsetsDirectional.start == edgeInsetsDirectional.top) {
        return {'all': edgeInsetsDirectional.start};
      }
      // If only horizontal and vertical are equal internally, use symmetric format
      return {
        'horizontal': edgeInsetsDirectional.start,
        'vertical': edgeInsetsDirectional.top,
      };
    }

    // If padding is different for any side, use the full directional format
    return {
      'start': edgeInsetsDirectional.start,
      'top': edgeInsetsDirectional.top,
      'end': edgeInsetsDirectional.end,
      'bottom': edgeInsetsDirectional.bottom,
    };
  }
}
