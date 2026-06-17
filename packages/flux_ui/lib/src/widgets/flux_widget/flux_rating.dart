import 'package:flutter/material.dart';

import '../../entities/entities.dart';

class FluxRating extends StatelessWidget {
  const FluxRating({
    super.key,
    required this.rating,
    required this.styleConfig,
  });

  final double rating;
  final FluxRatingStyleConfig styleConfig;

  @override
  Widget build(BuildContext context) {
    final color = styleConfig.color(context);
    return Wrap(
      children: [
        for (var i = 0; i < 5; i++)
          if (i + 0.5 < rating)
            Icon(Icons.star, size: styleConfig.size, color: color)
          else if (i + 0.0 < rating)
            Icon(Icons.star_half, size: styleConfig.size, color: color)
          else
            Icon(Icons.star_border, size: styleConfig.size, color: color),
      ],
    );
  }
}
