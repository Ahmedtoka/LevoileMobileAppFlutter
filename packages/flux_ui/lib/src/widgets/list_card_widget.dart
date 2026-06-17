import 'dart:math';

import 'package:flutter/material.dart';

import '../../flux_ui.dart';
import '../core/extensions/border_radius_geometry_ext.dart';
import '../entities/enums/list_card_style.dart';

class ListCardWidget extends StatelessWidget {
  const ListCardWidget({super.key, required this.config, this.onActionTap});

  final ListCardConfig config;
  final void Function(Map<String, dynamic>? action)? onActionTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isHorizontal = config.axis == Axis.horizontal;
        final measurements = _calculateMeasurements(
          context,
          constraints.maxWidth,
          isHorizontal,
        );

        /// create list of cards and add separator between them
        final children = _getChildren(
          context,
          isHorizontal: isHorizontal,
          maxItemWidth: measurements.maxItemWidth,
        );

        return SingleChildScrollView(
          padding: config.padding,
          scrollDirection: config.axis ?? Axis.vertical,
          physics: _getScrollPhysics(isHorizontal),
          child: isHorizontal
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: children,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
        );
      },
    );
  }

  List<Widget> _getChildren(
    BuildContext context, {
    required bool isHorizontal,
    required double maxItemWidth,
  }) {
    final items = List.generate(
      config.items?.length ?? 0,
      (index) => _buildCard(context, config.items![index], maxItemWidth),
    ).expand((e) => [e, _buildSeparator(isHorizontal)]).toList();
    if (items.isNotEmpty) {
      items.removeLast();
    }
    return items;
  }

  ScrollPhysics? _getScrollPhysics(bool isHorizontal) {
    return isHorizontal ? null : const NeverScrollableScrollPhysics();
  }

  Widget _buildSeparator(bool isHorizontal) {
    final divider = config.divider;

    if (divider != null) {
      if (!isHorizontal) {
        return divider;
      }
      final height =
          (config.heightContent ?? 0) +
          (config.heightImage ?? 0) +
          (config.heightAction ?? 0);

      return SizedBox(
        height: height,
        child: VerticalDivider(
          width: divider.height,
          indent: divider.indent,
          endIndent: divider.endIndent,
          color: divider.color,
          thickness: divider.thickness,
        ),
      );
    }

    return SizedBox(
      width: config.itemSpacing ?? 5,
      height: config.itemSpacing ?? 5,
    );
  }

  Widget _buildCard(
    BuildContext context,
    ItemListCardConfig item,
    double maxItemWidth,
  ) {
    return GestureDetector(
      onTap: () => onActionTap?.call(item.action?.action),
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: _getCardDecoration(context),
        padding: config.cardBoxStyle?.padding,
        margin: config.cardBoxStyle?.margin,
        constraints: BoxConstraints(maxWidth: maxItemWidth),
        child: ClipRRect(
          borderRadius:
              config.cardBoxStyle?.decoration?.borderRadius ??
              BorderRadius.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(context, item.imageUrl),
              _buildContent(context, item, maxItemWidth),
              _buildActionButton(context, item.action),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imageUrl) {
    return Container(
      height: config.heightImage,
      decoration: config.imageBoxStyle?.decoration,
      padding: config.imageBoxStyle?.padding,
      margin: config.imageBoxStyle?.margin,
      child: ClipRRect(
        borderRadius: _getImageBorderRadius(context),
        child: FluxImage(imageUrl: imageUrl, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ItemListCardConfig item,
    double maxItemWidth,
  ) {
    return Container(
      height: config.heightContent,
      padding: config.contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (config.style == ListCardStyle.subtitleHeading) ...[
            _buildSubtitleSection(context, item),
            _buildTitle(context, item, maxItemWidth),
          ] else ...[
            _buildTitle(context, item, maxItemWidth),
            _buildSubtitleSection(context, item),
          ],
        ],
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context,
    ItemListCardConfig item,
    double maxItemWidth,
  ) {
    final titleStyle = _getTitleStyle(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxItemWidth),
      child: Padding(
        padding: config.titleTextConfig?.padding ?? EdgeInsets.zero,
        child: Text(
          item.title,
          maxLines: config.titleTextConfig?.maxLines ?? 3,
          style: titleStyle,
        ),
      ),
    );
  }

  Widget _buildSubtitleSection(BuildContext context, ItemListCardConfig item) {
    return Wrap(
      children: [
        if (item.tags?.isNotEmpty ?? false)
          ...item.tags!.map((tag) => _buildTag(context, tag)),
        if (item.subtitle?.isNotEmpty ?? false)
          _buildSubtitle(context, item.subtitle!),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String tag) {
    return Container(
      decoration: config.tagBoxStyle?.decoration,
      padding: config.tagBoxStyle?.padding,
      margin: config.tagBoxStyle?.margin,
      child: Text(tag, style: _getTagStyle(context)),
    );
  }

  Widget _buildSubtitle(BuildContext context, String subtitle) {
    return Padding(
      padding: config.subtitleTextConfig?.padding ?? EdgeInsets.zero,
      child: Text(
        subtitle,
        maxLines: config.subtitleTextConfig?.maxLines ?? 2,
        style: _getSubtitleStyle(context),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    ActionItemCardConfig? actionConfig,
  ) {
    if (actionConfig?.title?.isEmpty ?? true) {
      return SizedBox(height: config.heightAction);
    }

    return SizedBox(
      height: config.heightAction,
      child: GestureDetector(
        onTap: () => onActionTap?.call(actionConfig.action),
        child: Container(
          decoration: config.actionBoxStyle?.decoration,
          padding: config.actionBoxStyle?.padding,
          margin: config.actionBoxStyle?.margin,
          child: Align(
            alignment: actionConfig!.alignment ?? AlignmentDirectional.center,
            child: Text(actionConfig.title!, style: _getActionStyle(context)),
          ),
        ),
      ),
    );
  }

  // Helper methods for styles and measurements
  _CardMeasurements _calculateMeasurements(
    BuildContext context,
    double screenWidth,
    bool isHorizontal,
  ) {
    final itemInLine = max(min(config.itemInLine ?? 1, 3), 1);

    final margin = config.cardBoxStyle?.margin;
    final marginHorizontal = (margin?.start ?? 0) + (margin?.end ?? 0);
    final maxItemWidth = isHorizontal
        ? (screenWidth - (config.itemSpacing ?? 0)) / itemInLine -
              marginHorizontal
        : screenWidth - marginHorizontal;

    return _CardMeasurements(maxItemWidth: maxItemWidth);
  }

  BorderRadius _getImageBorderRadius(BuildContext context) {
    final borderImage = config.imageBoxStyle?.decoration?.border;
    final borderRadiusImage = config.imageBoxStyle?.decoration?.borderRadius;

    return borderRadiusImage?.mergeWithBoxBorder(
          border: borderImage,
          direction: Directionality.of(context),
        ) ??
        BorderRadius.zero;
  }

  BoxDecoration _getCardDecoration(BuildContext context) {
    return (config.cardBoxStyle?.decoration ?? const BoxDecoration()).copyWith(
      color:
          config.cardBoxStyle?.decoration?.color ?? Theme.of(context).cardColor,
    );
  }

  TextStyle? _getTitleStyle(BuildContext context) {
    final itemTitleStyle = config.titleTextConfig?.style;
    return ThemeHelper.getFont(
      itemTitleStyle?.fontFamily,
      textStyle: Theme.of(context).textTheme.titleMedium?.merge(itemTitleStyle),
    );
  }

  TextStyle? _getSubtitleStyle(BuildContext context) {
    final itemSubtitleStyle = config.subtitleTextConfig?.style;
    return ThemeHelper.getFont(
      itemSubtitleStyle?.fontFamily,
      textStyle: Theme.of(
        context,
      ).textTheme.bodySmall?.merge(itemSubtitleStyle),
    );
  }

  TextStyle? _getTagStyle(BuildContext context) {
    final itemTagStyle = config.tagTextConfig?.style;
    return ThemeHelper.getFont(
      itemTagStyle?.fontFamily,
      textStyle: Theme.of(context).textTheme.bodySmall?.merge(itemTagStyle),
    );
  }

  TextStyle? _getActionStyle(BuildContext context) {
    final actionTitleStyle = config.actionTextConfig?.style;
    return ThemeHelper.getFont(
      actionTitleStyle?.fontFamily,
      textStyle: Theme.of(context).textTheme.bodySmall?.merge(actionTitleStyle),
    );
  }
}

class _CardMeasurements {
  const _CardMeasurements({required this.maxItemWidth});

  final double maxItemWidth;
}
