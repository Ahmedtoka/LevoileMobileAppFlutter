import 'package:flutter/material.dart';

import '../../entities/entities.dart';
import '../flux_widget/flux_list_view.dart';
import 'product_review_tile.dart';

class HorizontalTestimonial extends StatelessWidget {
  const HorizontalTestimonial({super.key, required this.config});

  final HorizontalTestimonialConfig config;

  @override
  Widget build(BuildContext context) {
    final items = config.resolvedItems;
    return FluxListView(
      config: config.listConfig,
      itemCount: items.length,
      itemBuilder: (context, index) => ProductReviewTile(config: items[index]),
    );
  }
}
