import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters/color_converter.dart';

part 'app_color.freezed.dart';
part 'app_color.g.dart';

enum MaterialColorName {
  primary,
  secondary,
  background,
  surface,
  error,
  onPrimary,
  onSecondary,
  onSurface;

  static MaterialColorName? fromString(String? name) {
    try {
      return MaterialColorName.values.firstWhereOrNull((e) => e.name == name);
    } catch (e) {
      return null;
    }
  }

  Function? getThemeColor() {
    switch (this) {
      case MaterialColorName.primary:
        return (ThemeData theme) => theme.colorScheme.primary;
      case MaterialColorName.secondary:
        return (ThemeData theme) => theme.colorScheme.secondary;
      case MaterialColorName.background:
        return (ThemeData theme) => theme.colorScheme.surface;
      case MaterialColorName.surface:
        return (ThemeData theme) => theme.colorScheme.surface;
      case MaterialColorName.error:
        return (ThemeData theme) => theme.colorScheme.error;
      case MaterialColorName.onPrimary:
        return (ThemeData theme) => theme.colorScheme.onPrimary;
      case MaterialColorName.onSecondary:
        return (ThemeData theme) => theme.colorScheme.onSecondary;
      case MaterialColorName.onSurface:
        return (ThemeData theme) => theme.colorScheme.onSurface;
    }
  }
}

/// A JSON-serializable color type that supports both solid colors and theme-based colors.
///
/// This class provides two ways to specify colors:
/// 1. Solid colors using direct color values
/// 2. Theme-based colors using material color names
///
/// Example usage with solid colors:
/// ```dart
/// // Serialization
/// final json = AppColor.solid(Colors.blue).toJson();
/// print(json); // {'color': '#FF2196F3'}
///
/// // Deserialization
/// final color = AppColor.fromJson({'color': '#FF2196F3'});
/// print(color); // AppColor.solid(Color(0xFF2196F3))
/// ```
///
/// Example usage with theme colors:
/// ```dart
/// // Serialization
/// final json = AppColor.theme(MaterialColorName.primary).toJson();
/// print(json); // {'materialColorName': 'primary'}
///
/// // Deserialization
/// final color = AppColor.fromJson({'materialColorName': 'primary'});
/// print(color); // AppColor.theme(MaterialColorName.primary)
/// ```
///
/// JSON Format Examples:
/// ```json
/// // Solid colors
/// {
///   "color": "#FF2196F3"    // Blue color with full opacity
/// }
/// {
///   "color": "#80FF0000"    // Red color with 50% opacity
/// }
///
/// // Theme-based colors
/// {
///   "materialColorName": "primary"     // Primary theme color
/// }
/// {
///   "materialColorName": "onSurface"   // On-surface theme color
/// }
///
/// // Null value
/// null                     // Results in transparent color
/// ```
///
/// Supported theme color names:
/// * 'primary' → Theme's primary color
/// * 'secondary' → Theme's secondary color
/// * 'background' → Theme's background color
/// * 'surface' → Theme's surface color
/// * 'error' → Theme's error color
/// * 'onPrimary' → Theme's on-primary color
/// * 'onSecondary' → Theme's on-secondary color
/// * 'onSurface' → Theme's on-surface color
///
/// Note:
/// - If an invalid value is provided during deserialization,
///   the converter defaults to [Colors.transparent]
/// - Theme colors are resolved at runtime based on the current [ThemeData]
/// - Use [resolve] method with a [BuildContext] to get the actual [Color] value

@freezed
abstract class AppColor with _$AppColor {
  const factory AppColor.solid(@ColorConverter() Color? color) = SolidColor;

  const factory AppColor.theme(MaterialColorName materialColorName) =
      ThemeColor;

  const AppColor._();

  factory AppColor.fromJson(Map<String, dynamic> json) =>
      _$AppColorFromJson(json);

  /// Creates an [AppColor] from a dynamic value
  /// Returns transparent color if the input is invalid
  static AppColor fromDynamic(dynamic value) {
    if (value == null) return const AppColor.solid(Colors.transparent);

    // Try parsing as direct color first
    const colorConverter = ColorConverter();
    final color = colorConverter.fromJson(value);
    if (color != null) return AppColor.solid(color);

    // Try parsing as theme color
    if (value is String) {
      final colorTheme = MaterialColorName.fromString(value);
      if (colorTheme != null) {
        return AppColor.theme(colorTheme);
      }
    }

    return const AppColor.solid(Colors.transparent);
  }

  static const AppColor primary = AppColor.theme(MaterialColorName.primary);

  static const AppColor secondary = AppColor.theme(MaterialColorName.secondary);

  static const AppColor surface = AppColor.theme(MaterialColorName.surface);

  Color call(BuildContext context) {
    return resolve(context) ?? Colors.transparent;
  }

  /// Resolves the color based on the current context
  Color? resolve(BuildContext context) {
    return map(
      solid: (color) => color.color,
      theme: (themeColor) {
        final theme = Theme.of(context);
        final colorGetter = themeColor.materialColorName.getThemeColor();
        return colorGetter?.call(theme);
      },
    );
  }
}
