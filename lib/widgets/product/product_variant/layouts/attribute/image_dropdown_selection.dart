import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../../../common/tools.dart';
import '../../../widgets/size_guide_button.dart';

/// Le Voile's variant selector.
///
/// Shows every option as a tile in a multi-row grid — the same layout the
/// website uses for Color — instead of a single row that could only preview
/// a handful of options behind a "+N" tile. Tapping a tile selects it
/// directly; with every option already on screen there is nothing left to
/// open in a separate sheet.
class ImageDropdownSelection extends StatelessWidget {
  final Map<String, String?>? imageUrls;
  final List<String?> options;
  final String? value;
  final String? title;
  final Function? onChanged;
  final String? productId;

  const ImageDropdownSelection({
    super.key,
    required this.options,
    required this.value,
    this.title,
    this.onChanged,
    this.imageUrls,
    this.productId,
  });

  /// Matches the website's grid: three swatches per row.
  static const int _crossAxisCount = 3;

  String? _imageFor(String? option) => imageUrls?[option];

  bool _isSelected(String? option) =>
      option?.toUpperCase() == value?.toUpperCase();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    title?.capitalize() ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (value?.isNotEmpty ?? false) ...[
                    const SizedBox(width: 8),
                    // The selected option's own name, which the tiles below
                    // already show too, but not every tile is above the fold.
                    Flexible(
                      child: Text(
                        value!.unescape(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SideGuideButtonWidget(attribute: title, productId: productId),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final option = options[index];
            final selected = _isSelected(option);
            final img = _imageFor(option);

            return GestureDetector(
              onTap: () => onChanged?.call(option),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected
                              ? primary
                              : theme.colorScheme.secondary
                                  .withValueOpacity(0.15),
                          width: selected ? 2 : 1,
                        ),
                      ),
                      // FluxImage = disk-cached + memory-sized, so the
                      // swatches load fast and don't re-download.
                      child: (img?.isNotEmpty ?? false)
                          ? FluxImage(
                              imageUrl: img!,
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(11),
                            )
                          : Center(
                              child: Text(
                                option?.toString().unescape() ?? '',
                                textAlign: TextAlign.center,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    option?.toString().unescape() ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                      color: selected ? primary : null,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
