import 'package:flutter/material.dart';

import '../../entities/flux_config/flux_card_config.dart';

class FluxCard extends StatelessWidget {
  const FluxCard({super.key, required this.config, this.child});

  final FluxCardConfig config;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    var child = this.child;
    final contentPadding = config.contentPadding;

    if (contentPadding != null) {
      child = Padding(padding: contentPadding, child: child);
    }

    return Card(
      color: config.color,
      shadowColor: config.shadowColor,
      surfaceTintColor: config.surfaceTintColor,
      elevation: config.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: config.borderRadius,
        side: config.borderSide,
      ),
      clipBehavior: config.clipBehavior,
      margin: config.margin,
      child: child,
    );
  }
}
