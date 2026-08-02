import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../../../common/tools.dart';
import '../../../widgets/size_guide_button.dart';

/// Le Voile's variant selector.
///
/// Shows a row of up to [_maxVisible] thumbnails so the shopper can see the
/// actual options at a glance instead of a dropdown reading "1". Tapping any
/// of them opens a bottom sheet with the complete list — the row is a preview,
/// the sheet is the picker. When there are more options than fit, the last
/// tile carries a "+N" badge so it is obvious something is hidden.
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

  /// Four tiles fit a phone at a readable thumbnail size; a fifth makes each
  /// one too small to tell two similar scarves apart.
  static const int _maxVisible = 4;

  String? _imageFor(String? option) => imageUrls?[option];

  bool _isSelected(String? option) =>
      option?.toUpperCase() == value?.toUpperCase();

  /// The thumbnails to show, and how many options are NOT among them.
  ///
  /// Two things this has to get right:
  ///
  /// * When there is overflow, the last of the four tiles is the "+N" tile —
  ///   it is a tile in its own right, not a badge painted over a thumbnail.
  ///   Overlaying it hid the option underneath, so the count was short by one
  ///   and the shopper was told "+8" when nine were unseen.
  /// * The SELECTED option must always be on screen. A plain `take(3)` meant
  ///   that picking colour #8 from the sheet left every visible tile unhighlighted
  ///   and no indication anywhere of what was chosen. If the selection falls
  ///   outside the window it takes the last thumbnail slot.
  ({List<String?> tiles, int hidden}) _preview() {
    if (options.length <= _maxVisible) {
      return (tiles: options, hidden: 0);
    }

    const slots = _maxVisible - 1; // three thumbnails + the "+N" tile
    final tiles = options.take(slots).toList();
    final selectedIndex = options.indexWhere(_isSelected);

    if (selectedIndex >= slots) {
      tiles[slots - 1] = options[selectedIndex];
    }

    return (tiles: tiles, hidden: options.length - slots);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    final preview = _preview();
    final tiles = preview.tiles;
    final hidden = preview.hidden;
    // The "+N" tile occupies one of the four slots when it exists.
    final slotCount = tiles.length + (hidden > 0 ? 1 : 0);

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
                    // The selected option's own name, which the thumbnails
                    // cannot show without crowding them.
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
        Row(
          children: [
            for (var i = 0; i < tiles.length; i++) ...[
              if (i > 0) const SizedBox(width: 10),
              Expanded(
                child: _Swatch(
                  option: tiles[i],
                  image: _imageFor(tiles[i]),
                  selected: _isSelected(tiles[i]),
                  onTap: () => _openPicker(context),
                ),
              ),
            ],

            // The "+N" tile — its own slot, so it never hides a thumbnail.
            if (hidden > 0) ...[
              const SizedBox(width: 10),
              Expanded(
                child: _MoreTile(
                  count: hidden,
                  onTap: () => _openPicker(context),
                ),
              ),
            ],

            // Empty slots keep the tiles square when there are fewer than four,
            // instead of stretching two thumbnails across the whole screen.
            // Every slot is flex: 1, so the real tiles keep their 4-up width.
            for (var i = slotCount; i < _maxVisible; i++) ...[
              const SizedBox(width: 10),
              const Expanded(child: SizedBox.shrink()),
            ],
          ],
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
                Row(
                  children: [
                    Text(
                      title?.capitalize() ?? '',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${options.length}',
                      style: TextStyle(
                        fontSize: 13,
                        color: theme.colorScheme.secondary.withValueOpacity(0.5),
                      ),
                    ),
                  ],
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
                      final selected = _isSelected(option);
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

/// One thumbnail in the preview row.
class _Swatch extends StatelessWidget {
  final String? option;
  final String? image;
  final bool selected;
  final VoidCallback onTap;

  const _Swatch({
    required this.option,
    required this.image,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;
    final hasImage = image?.isNotEmpty ?? false;

    return _Tile(
      selected: selected,
      onTap: onTap,
      child: hasImage
          ? FluxImage(imageUrl: image!, fit: BoxFit.cover)
          // No photo on this option — fall back to its name, which is all a
          // size or a named colour ever has anyway.
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  option?.toString().unescape() ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? primary : null,
                  ),
                ),
              ),
            ),
    );
  }
}

/// The "+N" tile that opens the full list. A slot of its own — painting it over
/// a thumbnail hid that option and made the count one short.
class _MoreTile extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const _MoreTile({required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return _Tile(
      selected: false,
      onTap: onTap,
      child: ColoredBox(
        color: const Color(0xFFFBF1F3),
        child: Center(
          child: Text(
            // LTR-pinned: '+' is a bidi-neutral character, so in Arabic the
            // sign would flip to the wrong side and read "8+".
            '+$count',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: primary,
            ),
          ),
        ),
      ),
    );
  }
}

/// The square, rounded, optionally-highlighted box both tiles sit in.
class _Tile extends StatelessWidget {
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  const _Tile({
    required this.selected,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final radius = BorderRadius.circular(12);

    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: radius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            child,

            // The ink layer sits ON TOP of the content, not under it.
            //
            // Material paints its splash and THEN paints its child, so an
            // InkWell wrapped around a full-bleed photo or a filled box shows
            // no ripple at all — it is drawn underneath an opaque widget. The
            // first version of this row had exactly that and felt dead to tap.
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onTap),
              ),
            ),

            // Border last, so the selection ring is never covered by the photo
            // or by the splash.
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    border: Border.all(
                      color: selected
                          ? theme.primaryColor
                          : theme.colorScheme.secondary.withValueOpacity(0.15),
                      width: selected ? 2 : 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
