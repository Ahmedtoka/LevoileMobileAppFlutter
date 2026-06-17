import 'package:flutter/material.dart';

import '../entities/image_config.dart';
import '../entities/product_preview.dart';
import 'flux_image.dart';

class ColorVariantProductCard extends StatelessWidget {
  final ProductPreview productPreview;
  final ImageConfig imageConfig;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onTap;

  const ColorVariantProductCard({
    super.key,
    required this.productPreview,
    required this.imageConfig,
    this.onFavoritePressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFavorite = productPreview.isFavorite;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              AspectRatio(
                aspectRatio: imageConfig.aspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: imageConfig.borderRadius,
                      child: FluxImage(
                        imageUrl: productPreview.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Discount Tag
                    if (productPreview.discountPercentage != null)
                      Align(
                        alignment: const AlignmentDirectional(-0.9, -0.9),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '-${productPreview.discountPercentage?.toStringAsFixed(0) ?? ''}%',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0.9, -0.9),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                        onPressed: onFavoritePressed,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    productPreview.title,
                    // TODO: Use theme
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Price Row
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      if (productPreview.hasDiscount)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 8.0),
                          child: Text(
                            productPreview.textDiscountedPrice.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Text(
                        productPreview.textPrice.toString(),
                        // TODO: Use theme
                        style: TextStyle(
                          fontSize: productPreview.hasDiscount ? 14 : 20,
                          decoration: productPreview.hasDiscount
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Color Variants
                  if (productPreview.colorVariants != null)
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: productPreview.colorVariants!
                          .map(
                            (color) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey[300]!, // Light border
                                  width: 1,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: color,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
