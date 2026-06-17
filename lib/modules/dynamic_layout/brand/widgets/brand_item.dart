import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../../common/tools.dart';
import '../../../../models/entities/brand.dart';
import '../../../../widgets/backdrop/filters/widgets/container_filter.dart';
import '../../config/brand_config.dart';

class BrandItem extends StatelessWidget {
  final Brand? brand;
  final void Function()? onTap;
  final bool isSelected;
  final bool useContainerFilter;
  final BrandConfig? config;

  const BrandItem({
    this.brand,
    this.onTap,
    this.isSelected = false,
    this.useContainerFilter = false,
    this.config,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryText = theme.primaryColor;
    final secondColor = theme.colorScheme.secondary;

    Widget content = SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          brand?.image != null
              ? ClipRRect(
                  borderRadius: (config?.isLogoCornerRounded ?? true)
                      ? const BorderRadius.all(Radius.circular(15.0))
                      : BorderRadius.zero,
                  child: FluxImage(
                    imageUrl: brand?.image ?? '',
                    width: 60.0,
                    height: 60.0,
                    fit: ImageTools.boxFit(config?.imageBoxFit ?? 'contain'),
                  ),
                )
              : const SizedBox(height: 60.0, width: 60.0),
          const SizedBox(height: 5),
          if (config?.isBrandNameShown ?? false)
            Expanded(
              child: Text(
                brand?.name ?? '',
                maxLines: 2,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isSelected
                      ? primaryText
                      : secondColor.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: useContainerFilter
          ? ContainerFilter(isSelected: isSelected, child: content)
          : content,
    );
  }
}
