import '../../../modules/dynamic_layout/helper/helper.dart';
import 'video_config.dart';

class SplashScreenConfig {
  late String type;
  late String image;
  late int duration;
  late String? boxFit;
  late bool enable;
  late String? backgroundColor;
  late double paddingTop;
  late double paddingBottom;
  late double paddingLeft;
  late double paddingRight;
  late String? animationName;
  static const String defaultImage = 'assets/images/splashscreen.flr';
  late VideoConfig? videoConfig;

  SplashScreenConfig({
    this.type = 'static',
    this.image = defaultImage,
    this.duration = 2000,
    this.boxFit,
    this.enable = true,
    this.backgroundColor,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.animationName,
    this.videoConfig,
  });

  SplashScreenConfig.fromJson(dynamic json) {
    type = json['type'] ?? 'static';
    image = json['image'] ?? defaultImage;
    duration = json['duration'] ?? 2000;
    boxFit = json['boxFit'];
    enable = json['enable'] ?? true;
    backgroundColor = json['backgroundColor'] ?? '#ffffff';
    paddingTop = Helper.formatDouble(json['paddingTop']) ?? 0.0;
    paddingBottom = Helper.formatDouble(json['paddingBottom']) ?? 0.0;
    paddingLeft = Helper.formatDouble(json['paddingLeft']) ?? 0.0;
    paddingRight = Helper.formatDouble(json['paddingRight']) ?? 0.0;
    animationName = json['animationName'];
    videoConfig = json['videoConfig'] is Map
        ? VideoConfig.fromJson(json['videoConfig'])
        : null;
  }

  Map toJson() {
    var map = <String, dynamic>{};
    map['type'] = type;
    map['image'] = image;
    map['duration'] = duration;
    map['boxFit'] = boxFit;
    map['enable'] = enable;
    map['backgroundColor'] = backgroundColor;
    map['paddingTop'] = paddingTop;
    map['paddingBottom'] = paddingBottom;
    map['paddingLeft'] = paddingLeft;
    map['paddingRight'] = paddingRight;
    map['animationName'] = animationName;
    map['videoConfig'] = videoConfig?.toJson();
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
