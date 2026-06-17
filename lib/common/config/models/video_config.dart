import 'dart:ui';

class VideoConfig {
  final bool autoPlay;
  final double? aspectRatio;
  final bool enableTimeIndicator;
  final bool tapToPlayPause;
  final bool holdToPlayPause;
  final bool isSoundOn;
  final bool doubleTapToFullScreen;
  final bool showVolumeButton;
  final bool showFullScreenButton;
  final bool enableLoop;
  final bool showLoading;
  final Color? backgroundColor;

  const VideoConfig({
    this.autoPlay = true,
    this.aspectRatio,
    this.enableTimeIndicator = false,
    this.tapToPlayPause = true,
    this.holdToPlayPause = false,
    this.isSoundOn = false,
    this.doubleTapToFullScreen = false,
    this.showVolumeButton = false,
    this.showFullScreenButton = false,
    this.enableLoop = false,
    this.showLoading = false,
    this.backgroundColor,
  });

  factory VideoConfig.fromJson(dynamic json) {
    return VideoConfig(
      autoPlay: json['autoPlay'] ?? true,
      aspectRatio: json['aspectRatio'],
      enableTimeIndicator: json['enableTimeIndicator'] ?? false,
      tapToPlayPause: json['tapToPlayPause'] ?? true,
      holdToPlayPause: json['holdToPlayPause'] ?? false,
      isSoundOn: json['isSoundOn'] ?? false,
      doubleTapToFullScreen: json['doubleTapToFullScreen'] ?? false,
      showVolumeButton: json['showVolumeButton'] ?? false,
      showFullScreenButton: json['showFullScreenButton'] ?? false,
      enableLoop: json['enableLoop'] ?? false,
      showLoading: json['showLoading'] ?? false,
      backgroundColor: json['backgroundColor'],
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['autoPlay'] = autoPlay;
    map['aspectRatio'] = aspectRatio;
    map['enableTimeIndicator'] = enableTimeIndicator;
    map['tapToPlayPause'] = tapToPlayPause;
    map['holdToPlayPause'] = holdToPlayPause;
    map['isSoundOn'] = isSoundOn;
    map['doubleTapToFullScreen'] = doubleTapToFullScreen;
    map['showVolumeButton'] = showVolumeButton;
    map['showFullScreenButton'] = showFullScreenButton;
    map['enableLoop'] = enableLoop;
    map['showLoading'] = showLoading;
    map['backgroundColor'] = backgroundColor;
    return map;
  }

  VideoConfig copyWith({
    bool? autoPlay,
    double? aspectRatio,
    bool? enableTimeIndicator,
    bool? tapToPlayPause,
    bool? holdToPlayPause,
    bool? isSoundOn,
    bool? doubleTapToFullScreen,
    bool? showVolumeButton,
    bool? showFullScreenButton,
    bool? enableLoop,
    bool? showLoading,
    Color? backgroundColor,
  }) {
    return VideoConfig(
      autoPlay: autoPlay ?? this.autoPlay,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      enableTimeIndicator: enableTimeIndicator ?? this.enableTimeIndicator,
      tapToPlayPause: tapToPlayPause ?? this.tapToPlayPause,
      holdToPlayPause: holdToPlayPause ?? this.holdToPlayPause,
      isSoundOn: isSoundOn ?? this.isSoundOn,
      doubleTapToFullScreen:
          doubleTapToFullScreen ?? this.doubleTapToFullScreen,
      showVolumeButton: showVolumeButton ?? this.showVolumeButton,
      showFullScreenButton: showFullScreenButton ?? this.showFullScreenButton,
      enableLoop: enableLoop ?? this.enableLoop,
      showLoading: showLoading ?? this.showLoading,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
