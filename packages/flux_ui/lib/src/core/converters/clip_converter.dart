import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [Clip] that handles serialization and deserialization
/// of Flutter's clip behavior values.
///
/// This converter supports converting between [Clip] enum values and their
/// corresponding string representations.
///
/// Example usage:
/// ```dart
/// // Serialization
/// final json = ClipConverter().toJson(Clip.antiAlias);
/// print(json); // 'antiAlias'
///
/// // Deserialization
/// final clip = ClipConverter().fromJson('antiAlias');
/// print(clip); // Clip.antiAlias
/// ```
///
/// JSON Format Examples:
/// ```json
/// "none"                    // No clipping
/// "hardEdge"               // Clips using a hard edge
/// "antiAlias"              // Clips with anti-aliasing
/// "antiAliasWithSaveLayer" // Clips with anti-aliasing and save layer
/// ```
///
/// Supported clip values:
/// * 'none' → Clip.none
///   - Doesn't clip at all
///   - Most efficient option
///
/// * 'hardEdge' → Clip.hardEdge
///   - Clips using a hard edge
///   - No anti-aliasing at the clip boundary
///   - More efficient than anti-aliased clipping
///
/// * 'antiAlias' → Clip.antiAlias
///   - Clips with anti-aliasing
///   - Smooths the clip boundary
///   - Less efficient than hard edge clipping
///
/// * 'antiAliasWithSaveLayer' → Clip.antiAliasWithSaveLayer
///   - Clips with anti-aliasing
///   - Creates a new save layer
///   - Least efficient option
///
/// Note:
/// - If an invalid value is provided during deserialization,
///   the converter defaults to [Clip.none]
/// - The choice of clip behavior can significantly impact rendering performance
/// - Use the least aggressive clipping that meets your needs
class ClipConverter implements JsonConverter<Clip?, String?> {
  const ClipConverter([this.defaultClip]);

  final Clip? defaultClip;

  @override
  Clip? fromJson(String? json) {
    if (json == null) return defaultClip;
    switch (json) {
      case 'none':
        return Clip.none;
      case 'hardEdge':
        return Clip.hardEdge;
      case 'antiAlias':
        return Clip.antiAlias;
      case 'antiAliasWithSaveLayer':
        return Clip.antiAliasWithSaveLayer;
      default:
        return defaultClip;
    }
  }

  @override
  String? toJson(Clip? clip) {
    if (clip == null) return null;
    switch (clip) {
      case Clip.none:
        return 'none';
      case Clip.hardEdge:
        return 'hardEdge';
      case Clip.antiAlias:
        return 'antiAlias';
      case Clip.antiAliasWithSaveLayer:
        return 'antiAliasWithSaveLayer';
    }
  }
}
