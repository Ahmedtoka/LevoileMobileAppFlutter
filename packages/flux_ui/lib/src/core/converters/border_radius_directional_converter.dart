import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [BorderRadiusDirectional] that handles circular, individual corners,
/// and horizontal/vertical pair radius configurations.
///
/// This converter supports three formats:
/// 1. Circular radius (all corners equal)
/// 2. Individual corner radii
/// 3. Horizontal/vertical pair radii
///
/// Example usage with circular radius:
/// ```dart
/// // Serialization
/// final json = BorderRadiusDirectionalConverter().toJson(
///   BorderRadiusDirectional.circular(8.0)
/// );
/// print(json); // {'circular': 8.0}
///
/// // Deserialization
/// final radius = BorderRadiusDirectionalConverter().fromJson({'circular': 8.0});
/// print(radius); // BorderRadiusDirectional.circular(8.0)
/// ```
///
/// Example usage with individual corners:
/// ```dart
/// // Serialization
/// final json = BorderRadiusDirectionalConverter().toJson(
///   BorderRadiusDirectional.only(
///     topStart: Radius.circular(8.0),
///     topEnd: Radius.circular(4.0),
///     bottomStart: Radius.circular(4.0),
///     bottomEnd: Radius.circular(8.0),
///   )
/// );
///
/// // Deserialization
/// final radius = BorderRadiusDirectionalConverter().fromJson({
///   'topStart': 8.0,
///   'topEnd': 4.0,
///   'bottomStart': 4.0,
///   'bottomEnd': 8.0,
/// });
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Circular radius (all corners equal)
/// {
///   "circular": 8.0
/// }
///
/// // Individual corners
/// {
///   "topStart": 8.0,
///   "topEnd": 4.0,
///   "bottomStart": 4.0,
///   "bottomEnd": 8.0
/// }
///
/// // Horizontal/vertical pairs
/// {
///   "horizontal": {
///     "start": 8.0,
///     "end": 4.0
///   },
///   "vertical": {
///     "top": 4.0,
///     "bottom": 8.0
///   }
/// }
///
/// // Null value
/// null                     // Results in BorderRadiusDirectional.zero
/// ```
///
/// Note:
/// - If an invalid or null value is provided during deserialization,
///   the converter defaults to [BorderRadiusDirectional.zero]
/// - The converter also handles conversion from [BorderRadius] to
///   [BorderRadiusDirectional] format when serializing
/// - All radius values should be positive numbers
class BorderRadiusDirectionalConverter
    implements JsonConverter<BorderRadiusDirectional, Map<String, dynamic>?> {
  const BorderRadiusDirectionalConverter();

  @override
  BorderRadiusDirectional fromJson(Map<String, dynamic>? json) {
    if (json == null) return BorderRadiusDirectional.zero;

    // Handle circular radius
    if (json.containsKey('circular')) {
      return BorderRadiusDirectional.circular(
        (json['circular'] as num?)?.toDouble() ?? 0.0,
      );
    }

    // Handle individual corners
    if (json.containsKey('topStart') ||
        json.containsKey('topEnd') ||
        json.containsKey('bottomStart') ||
        json.containsKey('bottomEnd')) {
      return BorderRadiusDirectional.only(
        topStart: Radius.circular(
          (json['topStart'] as num?)?.toDouble() ?? 0.0,
        ),
        topEnd: Radius.circular((json['topEnd'] as num?)?.toDouble() ?? 0.0),
        bottomStart: Radius.circular(
          (json['bottomStart'] as num?)?.toDouble() ?? 0.0,
        ),
        bottomEnd: Radius.circular(
          (json['bottomEnd'] as num?)?.toDouble() ?? 0.0,
        ),
      );
    }

    // Handle horizontal/vertical radius
    if (json.containsKey('horizontal') || json.containsKey('vertical')) {
      return BorderRadiusDirectional.horizontal(
        start: Radius.circular(
          (json['horizontal']?['start'] as num?)?.toDouble() ?? 0.0,
        ),
        end: Radius.circular(
          (json['horizontal']?['end'] as num?)?.toDouble() ?? 0.0,
        ),
      );
    }

    // Default to zero radius
    return BorderRadiusDirectional.zero;
  }

  @override
  Map<String, dynamic>? toJson(BorderRadiusGeometry? borderRadius) {
    if (borderRadius == null) return null;

    // Handle BorderRadiusDirectional type
    if (borderRadius is BorderRadiusDirectional) {
      // Check if it's a circular radius
      if (borderRadius.topStart == borderRadius.topEnd &&
          borderRadius.topStart == borderRadius.bottomStart &&
          borderRadius.topStart == borderRadius.bottomEnd) {
        return {'circular': borderRadius.topStart.x};
      }

      // Return individual corners
      return {
        'topStart': borderRadius.topStart.x,
        'topEnd': borderRadius.topEnd.x,
        'bottomStart': borderRadius.bottomStart.x,
        'bottomEnd': borderRadius.bottomEnd.x,
      };
    }

    // Handle BorderRadius type by converting to BorderRadiusDirectional
    if (borderRadius is BorderRadius) {
      // Convert to BorderRadiusDirectional format
      return {
        'topStart': borderRadius.topLeft.x,
        'topEnd': borderRadius.topRight.x,
        'bottomStart': borderRadius.bottomLeft.x,
        'bottomEnd': borderRadius.bottomRight.x,
      };
    }

    return null;
  }
}
