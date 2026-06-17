import 'dart:math';

import 'package:inspireui/extensions/color_extension.dart';
import 'package:inspireui/utils/colors.dart';

import '../core/helpers/helpers.dart';
import 'text_config.dart';

/// layout : 'logo'
/// showMenu : true
/// showLogo : true
/// showSearch : true
/// name : ''
/// color : ''
/// menuIcon : {'name':'','fontFamily':''}

const double _kLogoSize = 50.0;
const double _kIconSize = 24.0;
const double _kIconOpacity = 0.0;
const double _kOpacity = 1.0;
const double _kIconRadius = 6.0;
const double _kIconSpreadRadius = 0.0;
const double _kMinLogoSize = 10.0;

class LogoConfig {
  String? layout;
  String? image;
  bool? showMenu;
  bool showLogo = false;
  bool showSearch = false;
  bool showCart = false;
  bool showNotification = false;
  bool showBadgeCart = false;

  /// Use for multi-site app only
  bool showSwitcherSite = true;
  bool productType = true;
  double opacity = _kOpacity;
  double iconOpacity = _kIconOpacity;
  double iconRadius = _kIconRadius;
  double iconSpreadRadius = _kIconSpreadRadius;
  double iconSize = _kIconSize;
  double logoSize = _kLogoSize;
  HexColor? color;
  HexColor? iconColor;
  HexColor? iconBackground;
  MenuIcon? menuIcon;
  MenuIcon? cartIcon;
  MenuIcon? searchIcon;
  MenuIcon? notificationIcon;
  TextConfig? textConfig;

  LogoConfig({
    this.layout,
    this.showMenu,
    this.image,
    this.showLogo = false,
    this.showSearch = false,
    this.showCart = false,
    this.showNotification = false,
    this.showSwitcherSite = true,
    this.opacity = _kOpacity,
    this.iconOpacity = _kIconOpacity,
    this.iconRadius = _kIconRadius,
    this.iconSpreadRadius = _kIconSpreadRadius,
    this.iconSize = _kIconSize,
    this.logoSize = _kLogoSize,
    this.color,
    this.iconColor,
    this.iconBackground,
    this.cartIcon,
    this.searchIcon,
    this.menuIcon,
    this.notificationIcon,
    this.textConfig,
    this.showBadgeCart = false,
    this.productType = true,
  });

  LogoConfig.fromJson(dynamic json) {
    layout = json['layout'];
    textConfig = json['textConfig'] != null
        ? TextConfig.fromJson(json['textConfig'])
        : null;
    if (json['name'] != null && textConfig == null) {
      textConfig = TextConfig(text: json['name']);
    }
    image = json['image'];
    showMenu = json['showMenu'];
    showLogo = json['showLogo'] ?? false;
    showBadgeCart = json['showBadgeCart'] ?? false;
    productType = json['productType'] ?? true;

    showSearch = json['showSearch'] ?? false;
    showCart = json['showCart'] ?? false;
    showNotification = json['showNotification'] ?? false;

    showSwitcherSite =
        bool.tryParse(json['showSwitcherSite'].toString()) ?? true;

    opacity = FluxUiHelper.formatDouble(json['opacity']) ?? _kOpacity;
    iconOpacity =
        FluxUiHelper.formatDouble(json['iconOpacity']) ?? _kIconOpacity;
    iconRadius = FluxUiHelper.formatDouble(json['iconRadius']) ?? _kIconRadius;
    iconSpreadRadius =
        FluxUiHelper.formatDouble(json['iconSpreadRadius']) ??
        _kIconSpreadRadius;
    iconSize = FluxUiHelper.formatDouble(json['iconSize']) ?? _kIconSize;
    logoSize = max(
      FluxUiHelper.formatDouble(json['logoSize']) ?? _kLogoSize,
      _kMinLogoSize,
    );

    if (json['color'] != null) {
      color = HexColor(json['color']);
    }
    if (json['iconColor'] != null) {
      iconColor = HexColor(json['iconColor']);
    }
    if (json['iconBackground'] != null) {
      iconBackground = HexColor(json['iconBackground']);
    }

    searchIcon = json['searchIcon'] != null
        ? MenuIcon.fromJson(json['searchIcon'])
        : null;
    menuIcon = json['menuIcon'] != null
        ? MenuIcon.fromJson(json['menuIcon'])
        : null;
    cartIcon = json['cartIcon'] != null
        ? MenuIcon.fromJson(json['cartIcon'])
        : null;
    notificationIcon = json['notificationIcon'] != null
        ? MenuIcon.fromJson(json['notificationIcon'])
        : null;
  }

  LogoConfig copyWith({
    String? layout,
    String? image,
    bool? showMenu,
    bool? showLogo,
    bool? showSearch,
    bool? showCart,
    bool? showNotification,
    bool? showBadgeCart,
    bool? productType,
    double? opacity,
    double? iconOpacity,
    double? iconRadius,
    double? iconSpreadRadius,
    double? iconSize,
    double? logoSize,
    HexColor? color,
    HexColor? iconColor,
    HexColor? iconBackground,
    MenuIcon? menuIcon,
    MenuIcon? cartIcon,
    MenuIcon? searchIcon,
    MenuIcon? notificationIcon,
    TextConfig? textConfig,
  }) {
    return LogoConfig(
      layout: layout ?? this.layout,
      image: image ?? this.image,
      showMenu: showMenu ?? this.showMenu,
      showLogo: showLogo ?? this.showLogo,
      showSearch: showSearch ?? this.showSearch,
      showCart: showCart ?? this.showCart,
      showNotification: showNotification ?? this.showNotification,
      showBadgeCart: showBadgeCart ?? this.showBadgeCart,
      productType: productType ?? this.productType,
      opacity: opacity ?? this.opacity,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconRadius: iconRadius ?? this.iconRadius,
      iconSpreadRadius: iconSpreadRadius ?? this.iconSpreadRadius,
      iconSize: iconSize ?? this.iconSize,
      logoSize: logoSize ?? this.logoSize,
      color: color ?? this.color,
      iconColor: iconColor ?? this.iconColor,
      iconBackground: iconBackground ?? this.iconBackground,
      menuIcon: menuIcon ?? this.menuIcon,
      cartIcon: cartIcon ?? this.cartIcon,
      searchIcon: searchIcon ?? this.searchIcon,
      notificationIcon: notificationIcon ?? this.notificationIcon,
      textConfig: textConfig ?? this.textConfig,
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['layout'] = layout;
    map['image'] = image;
    map['showMenu'] = showMenu;
    map['showLogo'] = showLogo;
    map['showSearch'] = showSearch;
    map['showCart'] = showCart;
    map['showNotification'] = showNotification;
    map['showBadgeCart'] = showBadgeCart;
    map['productType'] = productType;
    map['opacity'] = opacity;
    map['iconOpacity'] = iconOpacity;
    map['iconRadius'] = iconRadius;
    map['iconSpreadRadius'] = iconSpreadRadius;
    map['iconSize'] = iconSize;
    map['logoSize'] = logoSize;
    map['color'] = color?.valueNum.toRadixString(16);
    map['iconColor'] = iconColor?.valueNum.toRadixString(16);
    map['iconBackground'] = iconBackground?.valueNum.toRadixString(16);
    map['menuIcon'] = menuIcon?.toJson();
    map['cartIcon'] = cartIcon?.toJson();
    map['searchIcon'] = searchIcon?.toJson();
    map['notificationIcon'] = notificationIcon?.toJson();
    map['textConfig'] = textConfig?.toJson();
    map.removeWhere((key, value) => value == null);
    return map;
  }
}

/// name : ''
/// fontFamily : ''

class MenuIcon {
  String? name;
  String? fontFamily;

  MenuIcon({this.name, this.fontFamily});

  MenuIcon.fromJson(dynamic json) {
    name = json['name'];
    fontFamily = json['fontFamily'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['fontFamily'] = fontFamily;
    return map;
  }
}
