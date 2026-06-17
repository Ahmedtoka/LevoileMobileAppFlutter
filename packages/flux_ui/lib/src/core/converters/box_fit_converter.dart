import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [BoxFit] that handles different box fitting strategies.
///
/// This converter supports string-based values for different fitting modes.
///
/// Example usage:
/// ```dart
/// // Serialization
/// final json = BoxFitConverter().toJson(BoxFit.cover);
/// print(json); // 'cover'
///
/// // Deserialization
/// final boxFit = BoxFitConverter().fromJson('cover');
/// print(boxFit); // BoxFit.cover
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Simple string values
/// "fill"           // Stretches content to fill space
/// "contain"        // Scales to fit while maintaining aspect ratio
/// "cover"          // Scales to cover while maintaining aspect ratio
/// "fitHeight"      // Scales to match height
/// "fit_height"     // Alternative format for fitHeight
/// "fitWidth"       // Scales to match width
/// "fit_width"      // Alternative format for fitWidth
/// "none"           // No scaling
/// "scaleDown"      // Scales down only if needed
/// "scale_down"     // Alternative format for scaleDown
///
/// // Null value
/// null             // Results in null box fit
/// ```
///
/// Supported values:
/// * 'fill' → BoxFit.fill
///   - Stretches content to fill the available space completely
/// * 'contain' → BoxFit.contain
///   - Scales content to fit within bounds while maintaining aspect ratio
/// * 'cover' → BoxFit.cover (default)
///   - Scales content to cover bounds while maintaining aspect ratio
/// * 'fitHeight' or 'fit_height' → BoxFit.fitHeight
///   - Scales content to match height while maintaining aspect ratio
/// * 'fitWidth' or 'fit_width' → BoxFit.fitWidth
///   - Scales content to match width while maintaining aspect ratio
/// * 'none' → BoxFit.none
///   - Content remains original size
/// * 'scaleDown' or 'scale_down' → BoxFit.scaleDown
///   - Scales content down to fit if needed, but won't scale up
///
/// Note:
/// - If an invalid value is provided during deserialization,
///   the converter defaults to [BoxFit.cover]
/// - The converter is case-insensitive when parsing values
/// - Some values support alternative snake_case format
class BoxFitConverter implements JsonConverter<BoxFit?, String?> {
  const BoxFitConverter();

  @override
  BoxFit? fromJson(String? json) {
    if (json == null) return null;

    switch (json.toLowerCase()) {
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'cover':
        return BoxFit.cover;
      case 'fitheight':
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fitwidth':
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scaledown':
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  @override
  String? toJson(BoxFit? boxFit) {
    if (boxFit == null) return null;

    switch (boxFit) {
      case BoxFit.fill:
        return 'fill';
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fitHeight:
        return 'fitHeight';
      case BoxFit.fitWidth:
        return 'fitWidth';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scaleDown';
    }
  }
}
