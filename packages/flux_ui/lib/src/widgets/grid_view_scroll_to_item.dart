import 'package:flutter/material.dart';

class GridViewScrollToItem extends StatefulWidget {
  const GridViewScrollToItem({
    super.key,
    this.crossAxisCount = 2,
    this.itemHeight = 150,
    this.padding = const EdgeInsets.all(8.0),
    this.spacing = 8.0,
    required this.itemBuilder,
    required this.itemCount,
    this.childAspectRatio = 1,
    this.indexInitial,
  });

  final int crossAxisCount;
  final double itemHeight;
  final double childAspectRatio;
  final EdgeInsets padding;
  final double spacing;
  final int itemCount;
  final int? indexInitial;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  State<GridViewScrollToItem> createState() => _GridViewScrollToItemState();
}

class _GridViewScrollToItemState extends State<GridViewScrollToItem> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.indexInitial != null && widget.indexInitial! >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollToItem(widget.indexInitial!);
      });
    }
  }

  void scrollToItem(int index) {
    if (index < 0 || index >= widget.itemCount) return;

    final rowIndex = index ~/ widget.crossAxisCount;
    final offsetY =
        rowIndex * (widget.itemHeight + widget.spacing) + widget.padding.top;

    _scrollController.animateTo(
      offsetY,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      padding: widget.padding,
      shrinkWrap: widget.itemCount > 200 ? false : true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        mainAxisSpacing: widget.spacing,
        crossAxisSpacing: widget.spacing,
        mainAxisExtent: widget.itemHeight,
        childAspectRatio: widget.childAspectRatio,
      ),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
