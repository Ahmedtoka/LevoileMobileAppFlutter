import 'package:flutter/material.dart';

import '../../core/extensions/item_size_config_ext.dart';
import '../../entities/flux_config/flux_list_view_config.dart';
import '../flex_separated.dart';

class FluxListView extends StatelessWidget {
  const FluxListView({
    super.key,
    required this.config,
    required this.itemBuilder,
    required this.itemCount,
  });

  final FluxListViewConfig config;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: config.padding,
      child: FlexSeparated.rowBuilder(
        crossAxisAlignment: CrossAxisAlignment.start,
        itemCount: itemCount,
        separationSize: config.itemSpacing,
        itemBuilder: (index) => SizedBox(
          width: config.itemSize.calculateItemSize(
            context,
            startPadding: config.padding?.start,
            spacing: config.itemSpacing,
          ),
          child: itemBuilder(context, index),
        ),
      ),
    );
    /*
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => SizedBox(
        width: config.itemSize.calculateItemSize(
          context,
          startPadding: config.padding?.start,
          spacing: config.itemSpacing,
        ),
        child: itemBuilder(context, index),
      ),
      separatorBuilder: (context, index) => SizedBox(width: config.itemSpacing),
      itemCount: itemCount,
    );
    */
  }
}
