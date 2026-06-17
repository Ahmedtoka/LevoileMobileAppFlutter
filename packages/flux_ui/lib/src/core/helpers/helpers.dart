import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'theme_helper.dart';

class FluxUiHelper {
  /// Convert String to double
  /// use for mapping JSON purpose and special logic, please consider twice when refactoring 🔥
  static double? formatDouble(dynamic value, [double defaultValue = 0.0]) {
    if (value == null || value == '') {
      return null;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    return double.tryParse(value) ?? defaultValue;
  }

  /// Convert String to int
  /// use for mapping JSON purpose and special logic, please consider twice when refactoring 🔥
  static int? formatInt([dynamic value = '0', int? defaultValue]) {
    if (value == null || value == '') {
      return defaultValue;
    }

    if (value is int) {
      return value;
    }
    if (value is double) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    }
    return defaultValue;
  }

  static BoxFit boxFit(String? fit, {BoxFit? defaultValue}) {
    switch (fit) {
      case 'contain':
        return BoxFit.contain;
      case 'fill':
        return BoxFit.fill;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'scaleDown':
        return BoxFit.scaleDown;
      case 'cover':
        return BoxFit.cover;
      default:
        return defaultValue ?? BoxFit.fitWidth;
    }
  }

  static String? compactNumberFormat(
    dynamic value, {
    double defaultValue = 0.0,
  }) {
    var number = value.toString();

    var doubleNumber = double.tryParse(number) ?? defaultValue;

    if (doubleNumber < 9999) {
      return doubleNumber.toStringAsFixed(1);
    }

    var numberFormat = NumberFormat.compact();

    return numberFormat.format(doubleNumber);
  }

  /// Get a unique color based on the input name
  /// This ensures consistent colors for the same name
  static Color getColorFromName(String name) {
    if (name.isEmpty) {
      return Colors.grey;
    }

    // Convert name to a hash code and ensure it's positive
    final hashCode = name.hashCode.abs();

    // Create HSL color with good saturation and lightness for readability
    // Use hash to determine hue (0-360)
    final hue = (hashCode % 360).toDouble();
    const saturation = 0.7; // High saturation for vibrant colors
    const lightness = 0.4; // Medium lightness for good contrast with white text

    // Convert HSL to Color
    return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
  }
}
