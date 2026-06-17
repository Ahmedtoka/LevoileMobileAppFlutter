import 'package:flutter/material.dart';

import '../../entities/flux_config/flux_container_config.dart';

class FluxContainer extends StatelessWidget {
  const FluxContainer({super.key, required this.config, this.child});

  /// The configuration for the container
  final FluxContainerConfig config;

  /// The widget below this widget in the tree
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: config.width,
      height: config.height,
      padding: config.padding,
      margin: config.margin,
      constraints: config.resolvedConstraints,
      decoration: config.decoration,
      alignment: config.alignment,
      clipBehavior: config.clipBehavior,
      child: child,
    );
  }
}
