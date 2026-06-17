import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_converter.dart';

/// A JSON converter for [TextStyle] that handles text styling properties including
/// color, size, weight, decoration, and more.
///
/// This converter supports a comprehensive set of text styling properties that can be
/// serialized to and from JSON format.
///
/// Example usage:
/// ```dart
/// // Serialization
/// final json = TextStyleConverter().toJson(
///   TextStyle(
///     color: Colors.blue,
///     fontSize: 16.0,
///     fontWeight: FontWeight.bold,
///   )
/// );
///
/// // Deserialization
/// final textStyle = TextStyleConverter().fromJson({
///   'color': '#FF0000FF',
///   'fontSize': 16.0,
///   'fontWeight': 'w700',
/// });
/// ```
///
/// JSON Format Example:
/// ```json
/// {
///   "color": "#FF0000FF",           // Color in ARGB hex format
///   "backgroundColor": "#FFFFFF",    // Background color in ARGB hex
///   "fontSize": 16.0,               // Font size in logical pixels
///   "fontWeight": "w700",           // Font weight (w100-w900)
///   "fontStyle": "italic",          // Font style (normal, italic)
///   "letterSpacing": 1.5,           // Letter spacing in logical pixels
///   "wordSpacing": 2.0,             // Word spacing in logical pixels
///   "height": 1.2,                  // Line height multiplier
///   "decoration": "underline",      // Text decoration
///   "decorationColor": "#FF0000",   // Decoration color in ARGB hex
///   "decorationStyle": "solid",     // Decoration style
///   "decorationThickness": 1.0,     // Decoration thickness
///   "fontFamily": "Roboto",         // Font family name
///   "overflow": "ellipsis",         // Text overflow handling
///   "shadows": [                    // List of text shadows
///     {
///       "color": "#80000000",
///       "offsetX": 1.0,
///       "offsetY": 1.0,
///       "blurRadius": 2.0
///     }
///   ]
/// }
/// ```
///
/// Supported values:
/// * fontWeight: 'w100' to 'w900'
/// * fontStyle: 'normal', 'italic'
/// * decoration: 'none', 'underline', 'overline', 'linethrough'
/// * decorationStyle: 'solid', 'double', 'dotted', 'dashed', 'wavy'
/// * overflow: 'clip', 'fade', 'ellipsis', 'visible'
///
/// Note:
/// - All properties are optional and will be omitted from JSON if null
/// - Colors are serialized in ARGB hex format
/// - Numeric values use double precision
/// - Font weights follow the w100-w900 naming convention
class TextStyleConverter
    implements JsonConverter<TextStyle?, Map<String, dynamic>?> {
  const TextStyleConverter();

  @override
  TextStyle? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return TextStyle(
      color: const ColorConverter().fromJson(json['color']),
      backgroundColor: const ColorConverter().fromJson(json['backgroundColor']),
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: _mapFontWeight(json['fontWeight'] as String?),
      fontStyle: _parseFontStyle(json['fontStyle'] as String?),
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      shadows: _parseShadows(json['shadows'] as List?),
      decoration: _parseTextDecoration(json['decoration'] as String?),
      decorationColor: const ColorConverter().fromJson(json['decorationColor']),
      decorationStyle: _parseDecorationStyle(
        json['decorationStyle'] as String?,
      ),
      decorationThickness: (json['decorationThickness'] as num?)?.toDouble(),
      fontFamily: json['fontFamily'] as String?,
      overflow: _parseTextOverflow(json['overflow'] as String?),
    );
  }

  @override
  Map<String, dynamic>? toJson(TextStyle? style) {
    if (style == null) return null;

    return {
      'color': const ColorConverter().toJson(style.color),
      'backgroundColor': const ColorConverter().toJson(style.backgroundColor),
      'fontSize': style.fontSize,
      'fontWeight': _fontWeightToString(style.fontWeight),
      'fontStyle': _fontStyleToString(style.fontStyle),
      'letterSpacing': style.letterSpacing,
      'wordSpacing': style.wordSpacing,
      'height': style.height,
      'shadows': _shadowsToJson(style.shadows),
      'decoration': _textDecorationToString(style.decoration),
      'decorationColor': const ColorConverter().toJson(style.decorationColor),
      'decorationStyle': _decorationStyleToString(style.decorationStyle),
      'decorationThickness': style.decorationThickness,
      'fontFamily': style.fontFamily,
      'overflow': _textOverflowToString(style.overflow),
    };
  }

  FontWeight? _mapFontWeight(String? weight) {
    if (weight == null) return null;
    switch (weight) {
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  String? _fontWeightToString(FontWeight? weight) {
    if (weight == null) return null;
    return 'w${(weight.value ~/ 100).clamp(1, 9)}00';
  }

  FontStyle? _parseFontStyle(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'normal':
        return FontStyle.normal;
      case 'italic':
        return FontStyle.italic;
      default:
        return null;
    }
  }

  String? _fontStyleToString(FontStyle? style) {
    if (style == null) return null;
    switch (style) {
      case FontStyle.normal:
        return 'normal';
      case FontStyle.italic:
        return 'italic';
    }
  }

  List<Shadow>? _parseShadows(List? shadows) {
    if (shadows == null) return null;
    return shadows.map((shadow) {
      final map = shadow as Map<String, dynamic>;
      return Shadow(
        color: const ColorConverter().fromJson(map['color']) ?? Colors.black,
        offset: Offset(
          (map['offsetX'] as num?)?.toDouble() ?? 0.0,
          (map['offsetY'] as num?)?.toDouble() ?? 0.0,
        ),
        blurRadius: (map['blurRadius'] as num?)?.toDouble() ?? 0.0,
      );
    }).toList();
  }

  List<Map<String, dynamic>>? _shadowsToJson(List<Shadow>? shadows) {
    if (shadows == null) return null;
    return shadows
        .map(
          (shadow) => {
            'color': const ColorConverter().toJson(shadow.color),
            'offsetX': shadow.offset.dx,
            'offsetY': shadow.offset.dy,
            'blurRadius': shadow.blurRadius,
          },
        )
        .toList();
  }

  TextDecoration? _parseTextDecoration(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'none':
        return TextDecoration.none;
      case 'underline':
        return TextDecoration.underline;
      case 'overline':
        return TextDecoration.overline;
      case 'linethrough':
        return TextDecoration.lineThrough;
      default:
        return null;
    }
  }

  String? _textDecorationToString(TextDecoration? decoration) {
    if (decoration == null) return null;
    if (decoration == TextDecoration.none) return 'none';
    if (decoration == TextDecoration.underline) return 'underline';
    if (decoration == TextDecoration.overline) return 'overline';
    if (decoration == TextDecoration.lineThrough) return 'linethrough';
    return null;
  }

  TextDecorationStyle? _parseDecorationStyle(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'solid':
        return TextDecorationStyle.solid;
      case 'double':
        return TextDecorationStyle.double;
      case 'dotted':
        return TextDecorationStyle.dotted;
      case 'dashed':
        return TextDecorationStyle.dashed;
      case 'wavy':
        return TextDecorationStyle.wavy;
      default:
        return null;
    }
  }

  String? _decorationStyleToString(TextDecorationStyle? style) {
    if (style == null) return null;
    switch (style) {
      case TextDecorationStyle.solid:
        return 'solid';
      case TextDecorationStyle.double:
        return 'double';
      case TextDecorationStyle.dotted:
        return 'dotted';
      case TextDecorationStyle.dashed:
        return 'dashed';
      case TextDecorationStyle.wavy:
        return 'wavy';
    }
  }

  TextOverflow? _parseTextOverflow(String? value) {
    if (value == null) return null;
    switch (value.toLowerCase()) {
      case 'clip':
        return TextOverflow.clip;
      case 'fade':
        return TextOverflow.fade;
      case 'ellipsis':
        return TextOverflow.ellipsis;
      case 'visible':
        return TextOverflow.visible;
      default:
        return null;
    }
  }

  String? _textOverflowToString(TextOverflow? overflow) {
    if (overflow == null) return null;
    switch (overflow) {
      case TextOverflow.clip:
        return 'clip';
      case TextOverflow.fade:
        return 'fade';
      case TextOverflow.ellipsis:
        return 'ellipsis';
      case TextOverflow.visible:
        return 'visible';
    }
  }
}
