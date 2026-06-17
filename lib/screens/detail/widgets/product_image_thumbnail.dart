import 'package:flutter/material.dart';

import '../../../common/tools.dart';
import '../../../widgets/thumbnail_video_widget.dart';

class ProductImageThumbnail extends StatefulWidget {
  final List<String> itemList;
  final bool hasVideo;
  final Function({required int index, bool? fullScreen}) onSelect;
  final int selectIndex;

  const ProductImageThumbnail({
    super.key,
    required this.itemList,
    this.hasVideo = false,
    required this.onSelect,
    this.selectIndex = 0,
  });

  @override
  State<ProductImageThumbnail> createState() => _ProductImageThumbnailState();
}

class _ProductImageThumbnailState extends State<ProductImageThumbnail> {
  final _padding = const EdgeInsets.all(1);
  final _margin = const EdgeInsets.only(right: 10, top: 4);

  @override
  Widget build(BuildContext context) {
    if (widget.itemList.isEmpty) {
      return const SizedBox();
    }

    // Le Voile: size thumbnails so exactly 4 fit per row (bigger than before).
    final available = MediaQuery.of(context).size.width - 95;
    final itemSize = ((available - 4 * 10) / 4).clamp(56.0, 96.0);

    return SizedBox(
      height: itemSize + 6,
      width: available,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 8),
            ...List<Widget>.generate(widget.itemList.length, (i) {
              Widget body = const SizedBox();
              final decoration = BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: widget.selectIndex == i
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 2,
                ),
              );

              if ((widget.hasVideo && i == 0)) {
                body = ThumbnailVideoWidget(
                  widget.itemList[i],
                  maxHeight: itemSize,
                  maxWidth: itemSize,
                  padding: _padding,
                  margin: _margin,
                  decoration: decoration,
                  duration: const Duration(milliseconds: 200),
                );
              } else {
                body = AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: _padding,
                  margin: _margin,
                  decoration: decoration,
                  child: ImageResize(
                    url: widget.itemList[i],
                    height: itemSize,
                    width: itemSize,
                    isResize: true,
                    fit: BoxFit.cover,
                  ),
                );
              }

              return GestureDetector(
                onDoubleTap: () => widget.onSelect(index: i, fullScreen: true),
                onLongPress: () => widget.onSelect(index: i, fullScreen: true),
                onTap: () => widget.onSelect(index: i),
                child: body,
              );
            }),
          ],
        ),
      ),
    );
  }
}
