import 'package:flutter/material.dart';

import '../../common/config/models/video_config.dart';
import '../../screens/detail/widgets/video_feature.dart';

class VideoSplashScreen extends StatelessWidget {
  final VoidCallback onSuccess;
  final Function(dynamic error, dynamic stacktrace)? onError;
  final String videoUrl;
  final Color backgroundColor;
  final BoxFit boxFit;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final VideoConfig? videoConfig;

  const VideoSplashScreen({
    super.key,
    required this.onSuccess,
    required this.videoUrl,
    this.onError,
    this.backgroundColor = Colors.white,
    this.boxFit = BoxFit.contain,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.videoConfig,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height,
      color: backgroundColor,
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: Center(
        child: FeatureVideoPlayer.fullScreen(
          videoUrl,
          videoConfig:
              videoConfig ??
              const VideoConfig(
                autoPlay: true,
                // aspectRatio: size.width / size.height,
                tapToPlayPause: false,
                enableLoop: false,
                isSoundOn: true,
                showLoading: false,
              ),
          onEnd: onSuccess,
          onError: onError,
        ),
      ),
    );
  }
}
