import 'package:flutter/material.dart';

import '../../constants.dart';

class ThemeConfig {
  String mainColor = '#3FC1BE';
  String? logoImage;
  String? backgroundColor;
  String? primaryColorLight;
  String? textColor;
  String? secondaryColor;
  // Le Voile: brand magenta. Overridden by Setting.saleColor from the
  // dashboard; this is only the pre-config fallback.
  String saleColor = '#9e197e';

  String get logo => logoImage ?? kLogo;
  Color get hexSaleColor => HexColor(saleColor);

  ThemeConfig({
    this.mainColor = '#3FC1BE',
    this.logoImage,
    this.backgroundColor,
    this.primaryColorLight,
    this.textColor,
    this.secondaryColor,
    this.saleColor = '#9e197e',
  });

  ThemeConfig.fromJson(Map config) {
    mainColor = config['MainColor'] ?? '#3FC1BE';
    logoImage = config['logo'];
    backgroundColor = config['backgroundColor'];
    primaryColorLight = config['primaryColorLight'];
    textColor = config['textColor'];
    secondaryColor = config['secondaryColor'];
    saleColor = config['saleColor'] ?? '#9e197e';
  }

  Map? toJson() {
    var map = <String, dynamic>{};
    map['MainColor'] = mainColor;
    map['logo'] = logoImage;
    map['backgroundColor'] = backgroundColor;
    map['primaryColorLight'] = primaryColorLight;
    map['textColor'] = textColor;
    map['saleColor'] = saleColor;
    map['secondaryColor'] = secondaryColor;
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
