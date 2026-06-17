import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../models/index.dart';
import '../../../services/index.dart';
import '../../../widgets/product/product_list.dart';

class FetchProductLayout extends StatefulWidget {
  final ScrollController? scrollController;
  final Category? category;
  final String? layout;
  final double? ratioProductImage;
  final double? padding;
  const FetchProductLayout({
    this.category,
    this.scrollController,
    this.layout,
    this.ratioProductImage,
    this.padding,
    super.key,
  });

  @override
  StateFetchProductLayout createState() => StateFetchProductLayout();
}

class StateFetchProductLayout extends State<FetchProductLayout> {
  int page = 1;
  bool isFetching = false;
  bool isEnd = false;
  List<Product> products = [];
  CancelableCompleter<List<Product>?>? completer;
  final Services _service = Services();
  AppModel get appModel => Provider.of<AppModel>(context, listen: false);
  UserModel get userModel => Provider.of<UserModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) {
        onRefresh();
      }
    });
  }

  @override
  void dispose() {
    completer?.operation.cancel();
    super.dispose();
  }

  Future<void> onLoadMore() async {
    if (isFetching) return;
    setState(() {
      isFetching = true;
    });
    completer = CancelableCompleter<List<Product>?>();
    completer?.complete(
      _service.api.fetchProductsByCategory(
        categoryId: widget.category?.id,
        page: page + 1,
        userId: userModel.user?.id,
        order: kProductCard.order,
        orderBy: kProductCard.orderby,
      ),
    );
    var values = await completer?.operation.valueOrCancellation();
    if (mounted) {
      if ((values?.length ?? 0) < 2) {
        setState(() {
          isEnd = true;
        });
      }
      setState(() {
        isFetching = false;
        products = [...products, ...(values ?? [])];
        page = page + 1;
      });
    }
  }

  Future<void> onRefresh() async {
    if (isFetching) return;
    setState(() {
      isFetching = true;
      products = [];
    });

    try {
      completer = CancelableCompleter<List<Product>?>();

      completer?.complete(
        _service.api.fetchProductsByCategory(
          categoryId: widget.category?.id,
          page: 1,
          userId: userModel.user?.id,
          order: kProductCard.order,
          orderBy: kProductCard.orderby,
        ),
      );
      var values = await completer?.operation.valueOrCancellation();
      if (mounted) {
        setState(() {
          isFetching = false;
          products = values ?? [];
          isEnd = false;
          page = 1;
        });
      }
    } catch (e) {
      setState(() {
        isFetching = false;
        products = [];
        isEnd = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Le Voile: products under a category always show 2 per row.
        // Coerce single-column layouts (card/listTile) to the 2-column grid.
        final resolvedLayout = widget.layout ?? appModel.productListLayout;
        final twoColLayout =
            (resolvedLayout == 'card' || resolvedLayout == 'listTile')
                ? 'list'
                : resolvedLayout;
        return ProductList(
          scrollController: widget.scrollController,
          width: constraints.maxWidth,
          products: products,
          isEnd: isEnd,
          isFetching: isFetching,
          onLoadMore: onLoadMore,
          onRefresh: onRefresh,
          layout: twoColLayout,
          padding: widget.padding ?? 8.0,
          ratioProductImage:
              widget.ratioProductImage ?? appModel.ratioProductImage,
          productListItemHeight: kProductDetail.productListItemHeight,
        );
      },
    );
  }
}
