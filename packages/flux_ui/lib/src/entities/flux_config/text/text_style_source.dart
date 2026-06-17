import 'package:flutter/material.dart';

enum TextStyleSource {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall;

  TextStyle? getTextStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    switch (this) {
      case TextStyleSource.displayLarge:
        return textTheme.displayLarge;
      case TextStyleSource.displayMedium:
        return textTheme.displayMedium;
      case TextStyleSource.displaySmall:
        return textTheme.displaySmall;
      case TextStyleSource.headlineLarge:
        return textTheme.headlineLarge;
      case TextStyleSource.headlineMedium:
        return textTheme.headlineMedium;
      case TextStyleSource.headlineSmall:
        return textTheme.headlineSmall;
      case TextStyleSource.titleLarge:
        return textTheme.titleLarge;
      case TextStyleSource.titleMedium:
        return textTheme.titleMedium;
      case TextStyleSource.titleSmall:
        return textTheme.titleSmall;
      case TextStyleSource.bodyLarge:
        return textTheme.bodyLarge;
      case TextStyleSource.bodyMedium:
        return textTheme.bodyMedium;
      case TextStyleSource.bodySmall:
        return textTheme.bodySmall;
      case TextStyleSource.labelLarge:
        return textTheme.labelLarge;
      case TextStyleSource.labelMedium:
        return textTheme.labelMedium;
      case TextStyleSource.labelSmall:
        return textTheme.labelSmall;
    }
  }
}
