import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../screens/base_screen.dart';

class StaticSplashScreen extends StatefulWidget {
  final String? imagePath;
  final VoidCallback? onNextScreen;
  final int duration;
  final Color backgroundColor;
  final BoxFit boxFit;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final Widget? errorWidget;

  const StaticSplashScreen({
    super.key,
    this.imagePath,
    this.onNextScreen,
    this.duration = 2500,
    this.backgroundColor = Colors.white,
    this.boxFit = BoxFit.contain,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.errorWidget,
  });

  @override
  BaseScreen<StaticSplashScreen> createState() => _StaticSplashScreenState();
}

class _StaticSplashScreenState extends BaseScreen<StaticSplashScreen> {
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: widget.duration), () {
      widget.onNextScreen?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          top: widget.paddingTop,
          bottom: widget.paddingBottom,
          left: widget.paddingLeft,
          right: widget.paddingRight,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return FluxImage(
              imageUrl: widget.imagePath!,
              fit: widget.boxFit,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              errorWidget: widget.errorWidget,
            );
          },
        ),
      ),
    );
  }
}
