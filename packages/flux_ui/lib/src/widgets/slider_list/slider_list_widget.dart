import 'dart:math';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../dynamic_layout/header_view/header_view.dart';
import '../../entities/enums/slider_layout_type.dart';
import '../../entities/slider_list_config.dart';
import '../background_color_widget.dart';
import '../flux_image.dart';

class SliderListWidget<T> extends StatefulWidget {
  const SliderListWidget({
    super.key,
    this.enableBackground = false,
    this.isCirclePageIndicator = false,
    required this.items,
    this.headerText,
    this.onTapSeeAll,
    this.textDirection,
    this.onTapItem,
    this.showSubtitleImage = true,
    required this.config,
  });

  final bool enableBackground;
  final bool isCirclePageIndicator;
  final TextDirection? textDirection;
  final String? headerText;
  final void Function()? onTapSeeAll;
  final List<SliderItemList<T>>? items;
  final void Function(BuildContext, SliderItemList<T>)? onTapItem;
  final bool showSubtitleImage;
  final SliderListConfig config;

  @override
  State<SliderListWidget<T>> createState() => _SliderListWidgetState<T>();
}

class _SliderListWidgetState<T> extends State<SliderListWidget<T>> {
  var currentIndex = 0;
  late List<SliderItemList<T>>? items = widget.items;

  @override
  void didUpdateWidget(SliderListWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    items = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    final enableBackground = widget.enableBackground;
    final isCirclePageIndicator = widget.isCirclePageIndicator;
    final config = widget.config;

    return BackgroundColorWidget(
      enable: enableBackground,
      child: Builder(
        builder: (_) {
          final direction = widget.textDirection ?? Directionality.of(context);

          return Column(
            children: <Widget>[
              if (widget.headerText != null)
                HeaderView(
                  headerText: widget.headerText ?? ' ',
                  showSeeAll: widget.onTapSeeAll != null ? true : false,
                  callback: widget.onTapSeeAll,
                ),
              if (items == null)
                _SliderListItemSkeleton(textDirection: direction)
              else
                CarouselSlider.builder(
                  itemCount: items!.length,
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    autoPlay: config.autoPlay,
                    autoPlayInterval: Duration(
                      seconds: config.secondsAutoSliding ?? 5,
                    ),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final item = items![index];

                    return _ItemListWidget<T>(
                      item: item,
                      onTap: () => widget.onTapItem?.call(context, item),
                      colorTag: config.colorTag != null
                          ? HexColor(config.colorTag)
                          : null,
                      colorTextTag: config.colorTextTag != null
                          ? HexColor(config.colorTextTag)
                          : null,
                      type: config.type,
                      paddingContent: EdgeInsets.all(
                        config.paddingContent ?? 12,
                      ),
                      textDirection: direction,
                      borderRadius: config.borderRadius,
                      showSubtitleImage: widget.showSubtitleImage,
                    );
                  },
                ),
              if ((items ?? []).length > 1)
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: min(config.limitIndicator, items!.length),
                  effect: isCirclePageIndicator
                      ? ExpandingDotsEffect(
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(
                            context,
                          ).primaryColor.withValueOpacity(0.4),
                        )
                      : SlideEffect(
                          spacing: 8.0,
                          radius: 5.0,
                          dotWidth: 24.0,
                          dotHeight: 2.0,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1.5,
                          dotColor: Theme.of(
                            context,
                          ).primaryColor.withValueOpacity(0.4),
                          activeDotColor: Theme.of(context).primaryColor,
                        ),
                ),
              const SizedBox(height: 8.0),
            ],
          );
        },
      ),
    );
  }
}

class _ItemListWidget<T> extends StatelessWidget {
  final SliderItemList<T> item;
  final VoidCallback? onTap;
  final TextDirection? textDirection;
  final double? borderRadius;
  final SliderLayoutType type;
  final EdgeInsetsGeometry paddingContent;
  final Color? colorTag;
  final Color? colorTextTag;
  final bool showSubtitleImage;

  const _ItemListWidget({
    required this.item,
    this.onTap,
    this.textDirection,
    this.borderRadius,
    this.type = SliderLayoutType.contentEndCard,
    this.paddingContent = const EdgeInsets.all(12),
    this.colorTag,
    this.colorTextTag,
    this.showSubtitleImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final direction = textDirection ?? Directionality.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: direction,
              children: <Widget>[
                if (item.image.isNotEmpty)
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(borderRadius ?? 0),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: FluxImage(
                          imageUrl: item.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 0),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF263238)],
                  ),
                ),
              ),
            ),
            Padding(
              padding: paddingContent,
              child: renderContentBanner<T>(
                item: item,
                context: context,
                colorTag: colorTag,
                colorTextTag: colorTextTag,
                type: type,
                showSubtitleImage: showSubtitleImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget renderContentBanner<T>({
  required SliderItemList<T> item,
  required BuildContext context,
  Color? colorTag,
  Color? colorTextTag,
  SliderLayoutType type = SliderLayoutType.contentEndCard,
  bool showSubtitleImage = true,
}) {
  const authorIcon = Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.person, size: 30),
  );

  const avatarSize = 25.0;

  var tagCategory = (item.tags?.isNotEmpty ?? false)
      ? Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            for (var tag in item.tags!)
              if (tag.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorTag ?? Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: colorTextTag ?? Colors.white,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                  ),
                ),
          ],
        )
      : const SizedBox();

  final titleWidget = Text(
    item.title,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 19,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: 3,
  );

  switch (type) {
    case SliderLayoutType.contentBetweenCard:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tagCategory,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              titleWidget,
            ],
          ),
        ],
      );
    default:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          tagCategory,
          const SizedBox(height: 8),
          titleWidget,
          const SizedBox(height: 8),
          Row(
            children: [
              item.imageSubTitle?.isNotEmpty ?? false
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Builder(
                        builder: (context) {
                          return FluxImage(
                            key: ValueKey('img: ${item.imageSubTitle}'),
                            imageUrl: item.imageSubTitle!,
                            errorWidget: authorIcon,
                            width: avatarSize,
                            height: avatarSize,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  : showSubtitleImage
                  ? authorIcon
                  : const SizedBox(),
              const SizedBox(width: 8.0),
              Text(
                item.subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ],
      );
  }
}

class _SliderListItemSkeleton extends StatelessWidget {
  const _SliderListItemSkeleton({this.textDirection = TextDirection.ltr});

  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 16, top: 12),
      child: SizedBox(
        height: 150,
        width: 400,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: textDirection,
          children: const [Flexible(child: Skeleton(width: double.infinity))],
        ),
      ),
    );
  }
}

class SliderItemList<T> {
  final String image;
  final String title;
  final String subTitle;
  final String? imageSubTitle;
  final List<String>? tags;
  final T data;

  SliderItemList({
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageSubTitle,
    this.tags,
    required this.data,
  });
}
