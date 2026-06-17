import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [BoxConstraints] that handles serialization and deserialization
/// of Flutter's box constraints.
///
/// This converter supports two formats:
/// 1. Complete constraints with all values specified
/// 2. Partial constraints where unspecified values use defaults
///
/// Example usage with complete constraints:
/// ```dart
/// // Serialization
/// final json = ConstraintsConverter().toJson(BoxConstraints(
///   minWidth: 100,
///   maxWidth: 300,
///   minHeight: 50,
///   maxHeight: 200,
/// ));
/// print(json); // {'minWidth': 100, 'maxWidth': 300, 'minHeight': 50, 'maxHeight': 200}
///
/// // Deserialization
/// final constraints = ConstraintsConverter().fromJson({
///   'minWidth': 100,
///   'maxWidth': 300,
///   'minHeight': 50,
///   'maxHeight': 200,
/// });
/// ```
///
/// Example usage with partial constraints:
/// ```dart
/// // Serialization
/// final json = ConstraintsConverter().toJson(BoxConstraints(
///   minWidth: 100,
///   minHeight: 50,
/// ));
/// print(json); // {'minWidth': 100, 'minHeight': 50}
///
/// // Deserialization
/// final constraints = ConstraintsConverter().fromJson({
///   'minWidth': 100,
///   'minHeight': 50,
/// });
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Complete constraints
/// {
///   "minWidth": 100.0,     // Minimum width constraint
///   "maxWidth": 300.0,     // Maximum width constraint
///   "minHeight": 50.0,     // Minimum height constraint
///   "maxHeight": 200.0     // Maximum height constraint
/// }
///
/// // Partial constraints
/// {
///   "minWidth": 100.0,     // Only minimum width specified
///   "minHeight": 50.0      // Only minimum height specified
/// }
///
/// // Null value
/// null                     // Results in null constraints
/// ```
///
/// Default values when properties are missing:
/// * minWidth: 0.0
/// * maxWidth: double.infinity
/// * minHeight: 0.0
/// * maxHeight: double.infinity
///
/// Note:
/// - All dimension values should be non-negative
/// - Maximum values must be greater than or equal to minimum values
/// - When serializing, only non-default values are included in the output
/// - Width and height constraints are independent of each other
/// - Values are always treated as logical pixels
class ConstraintsConverter
    implements JsonConverter<BoxConstraints?, Map<String, dynamic>?> {
  const ConstraintsConverter();

  @override
  BoxConstraints? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return BoxConstraints(
      minWidth: (json['minWidth'] as num?)?.toDouble() ?? 0.0,
      maxWidth: (json['maxWidth'] as num?)?.toDouble() ?? double.infinity,
      minHeight: (json['minHeight'] as num?)?.toDouble() ?? 0.0,
      maxHeight: (json['maxHeight'] as num?)?.toDouble() ?? double.infinity,
    );
  }

  @override
  Map<String, dynamic>? toJson(BoxConstraints? constraints) {
    if (constraints == null) return null;

    return {
      if (constraints.minWidth > 0) 'minWidth': constraints.minWidth,
      if (constraints.maxWidth < double.infinity)
        'maxWidth': constraints.maxWidth,
      if (constraints.minHeight > 0) 'minHeight': constraints.minHeight,
      if (constraints.maxHeight < double.infinity)
        'maxHeight': constraints.maxHeight,
    };
  }
}
