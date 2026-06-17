import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [AlignmentDirectional] that handles both predefined alignments
/// and custom coordinate-based alignments.
///
/// This converter supports two formats:
/// 1. Predefined alignments using string values
/// 2. Custom alignments using x, y coordinates
///
/// Example usage with predefined alignments:
/// ```dart
/// // Serialization
/// final json = AlignmentConverter().toJson(AlignmentDirectional.topStart);
/// print(json); // {'value': 'topStart'}
///
/// // Deserialization
/// final alignment = AlignmentConverter().fromJson({'value': 'topStart'});
/// print(alignment); // AlignmentDirectional.topStart
/// ```
///
/// Example usage with custom coordinates:
/// ```dart
/// // Serialization
/// final json = AlignmentConverter().toJson(AlignmentDirectional(0.5, -0.3));
/// print(json); // {'x': 0.5, 'y': -0.3}
///
/// // Deserialization
/// final alignment = AlignmentConverter().fromJson({'x': 0.5, 'y': -0.3});
/// print(alignment); // AlignmentDirectional(0.5, -0.3)
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Predefined alignments
/// {
///   "value": "topStart"     // Top-left alignment
/// }
/// {
///   "value": "center"       // Center alignment
/// }
/// {
///   "value": "bottomEnd"    // Bottom-right alignment
/// }
///
/// // Custom coordinate alignments
/// {
///   "x": 0.5,              // Range: -1.0 to 1.0
///   "y": -0.3              // Range: -1.0 to 1.0
/// }
///
/// // Null value
/// null                     // Results in null alignment
/// ```
///
/// Supported predefined alignment values:
/// * 'topStart' or 'topLeft' → AlignmentDirectional.topStart
/// * 'topCenter' → AlignmentDirectional.topCenter
/// * 'topEnd' or 'topRight' → AlignmentDirectional.topEnd
/// * 'centerStart' or 'centerLeft' → AlignmentDirectional.centerStart
/// * 'center' → AlignmentDirectional.center
/// * 'centerEnd' or 'centerRight' → AlignmentDirectional.centerEnd
/// * 'bottomStart' or 'bottomLeft' → AlignmentDirectional.bottomStart
/// * 'bottomCenter' → AlignmentDirectional.bottomCenter
/// * 'bottomEnd' or 'bottomRight' → AlignmentDirectional.bottomEnd
///
/// Note:
/// - If an invalid value is provided during deserialization,
///   the converter defaults to [AlignmentDirectional.center]
/// - For custom coordinates, values typically range from -1.0 to 1.0, where:
///   * x: -1.0 is far start/left, 1.0 is far end/right
///   * y: -1.0 is top, 1.0 is bottom
class AlignmentDirectionalConverter
    implements JsonConverter<AlignmentDirectional?, Map<String, dynamic>?> {
  const AlignmentDirectionalConverter();

  @override
  AlignmentDirectional? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    // Handle x, y coordinates if provided
    if (json.containsKey('x') && json.containsKey('y')) {
      final x = (json['x'] as num?)?.toDouble() ?? 0.0;
      final y = (json['y'] as num?)?.toDouble() ?? 0.0;
      return AlignmentDirectional(x, y);
    }

    // Handle predefined alignment values
    switch (json['value']) {
      case 'topStart':
      case 'topLeft':
        return AlignmentDirectional.topStart;
      case 'topCenter':
        return AlignmentDirectional.topCenter;
      case 'topEnd':
      case 'topRight':
        return AlignmentDirectional.topEnd;
      case 'centerStart':
      case 'centerLeft':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.center;
      case 'centerEnd':
      case 'centerRight':
        return AlignmentDirectional.centerEnd;
      case 'bottomStart':
      case 'bottomLeft':
        return AlignmentDirectional.bottomStart;
      case 'bottomCenter':
        return AlignmentDirectional.bottomCenter;
      case 'bottomEnd':
      case 'bottomRight':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.center;
    }
  }

  @override
  Map<String, dynamic>? toJson(AlignmentDirectional? alignment) {
    if (alignment == null) return null;

    // Handle predefined alignments
    if (alignment == AlignmentDirectional.topStart) {
      return {'value': 'topStart'};
    }

    if (alignment == AlignmentDirectional.topCenter) {
      return {'value': 'topCenter'};
    }

    if (alignment == AlignmentDirectional.topEnd) {
      return {'value': 'topEnd'};
    }

    if (alignment == AlignmentDirectional.centerStart) {
      return {'value': 'centerStart'};
    }

    if (alignment == AlignmentDirectional.center) {
      return {'value': 'center'};
    }

    if (alignment == AlignmentDirectional.centerEnd) {
      return {'value': 'centerEnd'};
    }

    if (alignment == AlignmentDirectional.bottomStart) {
      return {'value': 'bottomStart'};
    }

    if (alignment == AlignmentDirectional.bottomCenter) {
      return {'value': 'bottomCenter'};
    }

    if (alignment == AlignmentDirectional.bottomEnd) {
      return {'value': 'bottomEnd'};
    }

    // Handle custom alignment with x, y coordinates
    return {'x': alignment.start, 'y': alignment.y};
  }
}
