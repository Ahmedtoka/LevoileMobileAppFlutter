import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../common/constants.dart';
import '../../data/boxes.dart';
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
  // Le Voile: sequenced splash — the logo fades in first, then the slogan.
  late Animation<double> _logoFade;
  late Animation<double> _sloganFade;

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
    // Logo fades in over the first ~60%, slogan over the last ~45% (they
    // overlap slightly for a smooth, staggered reveal).
    _logoFade = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );
    _sloganFade = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
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
          // logo.png is 400 x 101 (ratio 3.96). The logo stays perfectly
          // centred and the slogan fades in *below* it (fixed size/position),
          // so nothing jumps or "pops" in size — only opacity animates.
          final logoWidth = size.width * 0.58;
          final logoHeight = logoWidth / 3.96;
          final slogan = SettingsBox().splashSlogan.trim();
          return LayoutBuilder(
            builder: (context, constraints) {
              final h = constraints.maxHeight.isFinite
                  ? constraints.maxHeight
                  : size.height;
              return Stack(
                children: [
                  // Logo — fades in first.
                  Center(
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
                  ),
                  // Slogan — fades in after, anchored just below the logo.
                  if (slogan.isNotEmpty)
                    Positioned(
                      left: 16,
                      right: 16,
                      top: h / 2 + logoHeight / 2 + 16,
                      child: FadeTransition(
                        opacity: _sloganFade,
                        child: Text(
                          slogan,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFFA51E8C),
                            fontSize: 12.5,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
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
