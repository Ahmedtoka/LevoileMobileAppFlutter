import 'package:flutter/material.dart';

import '../../entities/flux_config/flux_grid_view_config.dart';

class FluxGridView extends StatelessWidget {
  const FluxGridView({
    super.key,
    required this.gridConfig,
    required this.itemBuilder,
    this.itemCount,
    this.physics,
    this.shrinkWrap = false,
  });

  final FluxGridViewConfig gridConfig;
  final NullableIndexedWidgetBuilder itemBuilder;
  final int? itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: gridConfig.padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridConfig.crossAxisCount,
        crossAxisSpacing: gridConfig.crossAxisSpacing,
        mainAxisSpacing: gridConfig.mainAxisSpacing,
        childAspectRatio: gridConfig.childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
