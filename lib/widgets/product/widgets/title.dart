import 'dart:math';

import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html;

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/entities/product.dart';

class ProductTitle extends StatelessWidget {
  final Product product;
  final bool hide;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final int? maxLines;
  final bool textCenter;
  final bool? resizeByMaxLines;

  const ProductTitle({
    super.key,
    required this.product,
    this.style,
    this.strutStyle,
    required this.hide,
    this.textCenter = false,
    this.maxLines,
    this.resizeByMaxLines = true,
  });

  int get _lineCount => maxLines ?? 2;

  bool get _isResizeByMaxLines => resizeByMaxLines ?? true;

  String _convertHtmlToText(String htmlString) {
    final document = html.parse(htmlString);
    return document.body?.text ?? '';
  }

  String _getPinnedTag() {
    var pinnedTag = '';
    if (kAdvanceConfig.pinnedProductTags.isNotEmpty) {
      for (var tag in product.tags) {
        final foundedTag = kAdvanceConfig.pinnedProductTags.any((element) {
          final tagName = tag.name?.toLowerCase().trim();
          final hasTagName = tagName?.isNotEmpty ?? false;

          return hasTagName &&
              (element.toLowerCase().trim() == tagName ||
                  element == tag.id ||
                  element == tag.slug);
        });
        if (foundedTag) {
          pinnedTag = tag.name ?? '';

          /// Only show first one tag.
          break;
        }
      }
    }
    return pinnedTag;
  }

  TextStyle? getTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle =
        style ?? theme.textTheme.titleMedium?.apply(fontSizeFactor: 0.9);

    final fontSize =
        baseStyle?.fontSize ?? theme.textTheme.titleMedium?.fontSize ?? 14.0;
    return baseStyle?.copyWith(fontSize: fontSize);
  }

  double getMaxTextHeight({
    TextStyle? style,
    StrutStyle? strutStyle,
    required int maxLines,
    TextScaler textScaler = TextScaler.noScaling,
    required String text,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      strutStyle: strutStyle,
      textScaler: textScaler,
      textDirection: textDirection,
      maxLines: 1,
    );
    painter.layout();
    // Use preferredLineHeight (full line-box including leading) instead of
    // painter.height (tight glyph box of a single line). The latter can be
    // smaller than the real per-line height the Text widget uses when it
    // actually wraps to multiple lines, which causes the last line to be
    // vertically clipped.
    return painter.preferredLineHeight * maxLines;
  }

  @override
  Widget build(BuildContext context) {
    if (hide) return const SizedBox();

    final productNameText = _convertHtmlToText(product.name ?? '');
    final pinnedTag = _getPinnedTag();
    final textScaler = MediaQuery.textScalerOf(context);

    final hasValidMaxScale = kMaxTextScale != null && kMaxTextScale! > 0;
    final textScale = hasValidMaxScale
        ? textScaler.clamp(
            minScaleFactor: 0.1,
            maxScaleFactor: min(2.0, max(0.1, kMaxTextScale!)),
          )
        : textScaler;
    // Merge with DefaultTextStyle so the painter measures with the same
    // resolved style (font family, height, leading, etc.) that Text.rich
    // will actually use to render. Without this the measurement can drift
    // from the render and cause the last line to be clipped.
    final textStyle = DefaultTextStyle.of(
      context,
    ).style.merge(getTextStyle(context));

    final fixedHeight = _isResizeByMaxLines
        ? getMaxTextHeight(
            style: textStyle,
            strutStyle: strutStyle,
            maxLines: _lineCount,
            textScaler: textScale,
            textDirection: Directionality.of(context),
            text: productNameText,
          )
        : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: fixedHeight ?? 0),
            child: Text.rich(
              textAlign: textCenter ? TextAlign.center : null,
              TextSpan(
                children: [
                  if (pinnedTag.isNotEmpty) ...[
                    _buildPinnedTag(context, pinnedTag),
                    const WidgetSpan(child: SizedBox(width: 4.0)),
                  ],
                  TextSpan(text: productNameText),
                ],
              ),
              maxLines: _isResizeByMaxLines ? _lineCount : null,
              overflow: _isResizeByMaxLines
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
              style: textStyle,
              strutStyle: strutStyle,
              textScaler: textScale,
            ),
          ),
        ),
        if (product.verified ?? false)
          Icon(
            Icons.verified_user,
            size: 18,
            color: Theme.of(context).colorScheme.secondary,
          ),
      ],
    );
  }

  WidgetSpan _buildPinnedTag(BuildContext context, String pinnedTag) {
    final theme = Theme.of(context);

    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                style?.color ??
                theme.textTheme.titleMedium?.color ??
                theme.colorScheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          pinnedTag.toTitleCase(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
