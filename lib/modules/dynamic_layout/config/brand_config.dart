/// Example Brand config
///
/// layout: 'brand',
/// name: 'Our Brand Choice',
/// isBrandNameShown: true,
/// isLogoCornerRounded: true,
/// imageBoxFit: 'contain',
/// topBrand: ['1', '2', '3']

class BrandConfig {
  String? layout;
  String? name;
  bool isBrandNameShown = true;
  bool isLogoCornerRounded = true;
  bool enableBackground = false;
  String? imageBoxFit;
  List<String>? topBrand;

  BrandConfig(
    this.layout,
    this.isBrandNameShown,
    this.isLogoCornerRounded,
    this.enableBackground,
    this.imageBoxFit,
    this.topBrand,
  );

  BrandConfig.fromJson(dynamic json) {
    layout = json['layout'];
    name = json['name'];
    isBrandNameShown =
        bool.tryParse(json['isBrandNameShown'].toString()) ?? true;
    isLogoCornerRounded =
        bool.tryParse(json['isLogoCornerRounded'].toString()) ?? true;
    enableBackground =
        bool.tryParse(json['enableBackground'].toString()) ?? false;
    imageBoxFit = json['imageBoxFit'];
    topBrand = json['topBrand'] is List
        ? (json['topBrand'] as List).map((e) => '$e').toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['layout'] = layout;
    map['name'] = name;
    map['isBrandNameShown'] = isBrandNameShown;
    map['isLogoCornerRounded'] = isLogoCornerRounded;
    map['enableBackground'] = enableBackground;
    map['imageBoxFit'] = imageBoxFit;
    map['topBrand'] = topBrand;
    return map;
  }
}
