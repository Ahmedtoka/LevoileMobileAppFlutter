import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/core.dart';
import 'app_color.dart';

part 'app_text_style.freezed.dart';
part 'app_text_style.g.dart';

@freezed
abstract class AppTextStyle with _$AppTextStyle {
  const factory AppTextStyle({
    AppColor? color,
    AppColor? backgroundColor,
    double? fontSize,
    @FontWeightConverter() FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    @ShadowsConverter() List<Shadow>? shadows,
    @TextDecorationConverter() TextDecoration? decoration,
    AppColor? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    TextOverflow? overflow,
  }) = _AppTextStyle;

  const AppTextStyle._();

  factory AppTextStyle.fromJson(Map<String, dynamic> json) =>
      _$AppTextStyleFromJson(json);

  factory AppTextStyle.fromTextStyle(TextStyle textStyle) {
    return AppTextStyle(
      color: textStyle.color != null ? AppColor.solid(textStyle.color) : null,
      backgroundColor: textStyle.backgroundColor != null
          ? AppColor.solid(textStyle.backgroundColor)
          : null,
      fontSize: textStyle.fontSize,
      fontWeight: textStyle.fontWeight,
      fontStyle: textStyle.fontStyle,
      letterSpacing: textStyle.letterSpacing,
      wordSpacing: textStyle.wordSpacing,
      height: textStyle.height,
      shadows: textStyle.shadows,
      decoration: textStyle.decoration,
      decorationColor: textStyle.decorationColor != null
          ? AppColor.solid(textStyle.decorationColor)
          : null,
      decorationStyle: textStyle.decorationStyle,
      decorationThickness: textStyle.decorationThickness,
      fontFamily: textStyle.fontFamily,
      overflow: textStyle.overflow,
    );
  }

  TextStyle resolve(BuildContext context) {
    return ThemeHelper.getFont(
      fontFamily,
      textStyle: TextStyle(
        color: color?.resolve(context),
        backgroundColor: backgroundColor?.resolve(context),
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        shadows: shadows,
        decoration: decoration,
        decorationColor: decorationColor?.resolve(context),
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        overflow: overflow,
      ),
    );
  }
}
