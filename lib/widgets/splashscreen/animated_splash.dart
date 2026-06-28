import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../common/constants.dart';
import '../../screens/base_screen.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({
    super.key,
    required this.next,
    required this.imagePath,
    this.animationEffect = 'fade-in',
    this.duration = 1000,
    this.backgroundColor = Colors.white,
    this.boxFit = BoxFit.contain,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.errorWidget,
  });

  final VoidCallback? next;
  final String imagePath;
  final int duration;
  final String animationEffect;
  final Color backgroundColor;
  final BoxFit boxFit;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: paddingTop,
          bottom: paddingBottom,
          left: paddingLeft,
          right: paddingRight,
        ),
        child: _AnimatedSplashChild(
          next: next,
          imagePath: imagePath,
          duration: duration,
          animationEffect: animationEffect,
          boxFit: boxFit,
          errorWidget: errorWidget,
        ),
      ),
    );
  }
}

class _AnimatedSplashChild extends StatefulWidget {
  final VoidCallback? next;
  final String imagePath;
  final int duration;
  final String animationEffect;
  final BoxFit boxFit;
  final Widget? errorWidget;

  const _AnimatedSplashChild({
    required this.next,
    required this.imagePath,
    required this.animationEffect,
    this.duration = 1000,
    this.boxFit = BoxFit.contain,
    this.errorWidget,
  });

  @override
  __AnimatedSplashStateChild createState() => __AnimatedSplashStateChild();
}

class __AnimatedSplashStateChild extends BaseScreen<_AnimatedSplashChild>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  // Le Voile: the logo fades in on the splash.
  late Animation<double> _logoFade;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInCubic),
    );
    _logoFade = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 1500)).then((value) {
          widget.next?.call();
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.reset();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(Size size) {
    switch (widget.animationEffect) {
      case SplashScreenTypeConstants.fadeIn:
        {
          // logo.png is 400 x 101 (ratio 3.96). Centered logo only — fades in.
          final logoWidth = size.width * 0.58;
          final logoHeight = logoWidth / 3.96;
          return Center(
            child: FadeTransition(
              opacity: _logoFade,
              child: SizedBox(
                width: logoWidth,
                height: logoHeight,
                child: FluxImage(
                  imageUrl: widget.imagePath,
                  fit: BoxFit.contain,
                  width: logoWidth,
                  height: logoHeight,
                  errorWidget: widget.errorWidget,
                ),
              ),
            ),
          );
        }
      case SplashScreenTypeConstants.zoomIn:
        {
          return ScaleTransition(
            scale: _animation,
            child: FluxImage(
              imageUrl: widget.imagePath,
              fit: widget.boxFit,
              height: size.height,
              width: size.width,
              errorWidget: widget.errorWidget,
            ),
          );
        }
      case SplashScreenTypeConstants.zoomOut:
        {
          return ScaleTransition(
            scale: Tween(begin: 2.1, end: 1.0).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInCirc,
              ),
            ),
            child: FluxImage(
              imageUrl: widget.imagePath,
              fit: widget.boxFit,
              height: size.height,
              width: size.width,
              errorWidget: widget.errorWidget,
            ),
          );
        }
      case SplashScreenTypeConstants.topDown:
      default:
        {
          return SizeTransition(
            sizeFactor: _animation,
            child: FluxImage(
              imageUrl: widget.imagePath,
              fit: widget.boxFit,
              height: size.height,
              width: size.width,
              errorWidget: widget.errorWidget,
            ),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _buildAnimation(size);
  }
}
