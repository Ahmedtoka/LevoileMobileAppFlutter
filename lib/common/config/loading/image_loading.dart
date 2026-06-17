import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../models/loading_config.dart';

/// Le Voile loading indicator: the brand logo with a gentle pulse so it reads
/// as an active loading state instead of a static image.
class ImageLoading extends StatefulWidget {
  final LoadingConfig loadingConfig;
  const ImageLoading(this.loadingConfig);

  @override
  State<ImageLoading> createState() => _ImageLoadingState();
}

class _ImageLoadingState extends State<ImageLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  late final Animation<double> _scale = Tween(begin: 0.85, end: 1.0).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  );

  late final Animation<double> _opacity = Tween(begin: 0.55, end: 1.0).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final path = widget.loadingConfig.path;
    if (path?.isEmpty ?? true) return const SizedBox();
    final size = (widget.loadingConfig.size ?? 70).toDouble();
    return Center(
      child: FadeTransition(
        opacity: _opacity,
        child: ScaleTransition(
          scale: _scale,
          child: FluxImage(
            imageUrl: path!,
            width: size,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
