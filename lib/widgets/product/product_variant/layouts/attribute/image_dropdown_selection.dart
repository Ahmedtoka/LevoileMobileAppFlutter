import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../../../common/tools.dart';
import '../../../widgets/size_guide_button.dart';

/// A chic dropdown-style variant selector for Le Voile.
///
/// Shows an elegant dropdown field with the selected option (thumbnail + name).
/// Tapping it opens a bottom sheet displaying the variation options with large
/// images so the shopper can pick by looking at the actual product image.
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

  String? _imageFor(String? option) => imageUrls?[option];

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
              child: Text(
                title?.capitalize() ?? '',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SideGuideButtonWidget(attribute: title, productId: productId),
          ],
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _openPicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.secondary.withValueOpacity(0.25),
              ),
              color: theme.colorScheme.surface,
            ),
            child: Row(
              children: [
                if ((_imageFor(value)?.isNotEmpty ?? false)) ...[
                  FluxImage(
                    imageUrl: _imageFor(value)!,
                    width: 34,
                    height: 34,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Text(
                    value?.toString().unescape() ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: primary),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openPicker(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary.withValueOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  title?.capitalize() ?? '',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.68,
                    ),
                    itemBuilder: (context, index) {
                      final option = options[index];
                      final selected =
                          option?.toUpperCase() == value?.toUpperCase();
                      final img = _imageFor(option);
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(ctx).pop();
                          onChanged?.call(option);
                        },
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
                                fontWeight:
                                    selected ? FontWeight.w700 : FontWeight.w400,
                                color: selected ? primary : null,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
