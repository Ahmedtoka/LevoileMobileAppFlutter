import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/entities/products_list_filter.dart';
import '../../../models/index.dart';
import '../../../modules/analytics/analytics.dart';
import '../../../modules/dynamic_layout/config/product_config.dart';
import '../../../services/services.dart';
import '../../../widgets/product/product_bottom_sheet.dart';
import '../../common/app_bar_mixin.dart';
import '../filter_mixin/products_filter_mixin.dart';
import '../products_mixin.dart';

abstract class ProductsLayout extends StatefulWidget {
  final List<Product>? products;
  final ProductConfig? config;
  final ProductsListFilter? productsListFilter;
  final Duration countdownDuration;
  final bool autoFocusSearch;

  const ProductsLayout({
    super.key,
    this.products,
    this.config,
    this.countdownDuration = Duration.zero,
    this.autoFocusSearch = true,
    this.productsListFilter,
  });
}

abstract class StateProductLayout<T extends ProductsLayout> extends State<T>
    with
        SingleTickerProviderStateMixin,
        AppBarMixin,
        ProductsMixin,
        ProductsFilterMixin {
  late AnimationController filterController;

  bool get hasAppBar => showAppBar(RouteList.backdrop);

  ProductConfig get productConfig => widget.config ?? ProductConfig.empty();

  ProductModel get productModel => context.read<ProductModel>();

  UserModel get userModel => context.read<UserModel>();

  AppModel get appModel => context.read<AppModel>();

  /// Image ratio from Product Cart
  double get ratioProductImage => appModel.ratioProductImage;

  double get productListItemHeight => kProductDetail.productListItemHeight;

  bool get showBottomCornerCart => kAdvanceConfig.showBottomCornerCart;

  String? _currentTitle;

  String get currentTitle {
    if (search != null) {
      return S.of(context).results;
    }
    return _currentTitle ?? productModel.categoryName ?? S.of(context).results;
  }

  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _currentTitle =
        productConfig.name ??
        ((productModel.categoryIds?.isNotEmpty ?? false)
            ? categoryModel
                  .getCategoryById(productModel.categoryIds!.first)
                  ?.name
            : null);
    _initFilter();
    filterController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
      value: 1.0,
    );
    Analytics.triggerViewListProduct(widget.products, context);

    /// only request to server if there is empty config params
    // / If there is config, load the products one
  }

  void _initFilter() {
    WidgetsBinding.instance.endOfFrame.then((_) async {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      var productType = false;

      if (routeArgs is BackDropArguments) {
        productType = routeArgs.config?['productType'] ?? false;
      }

      productModel.fetchProductsByCategory(
        productType: productType,
        notify: false,
      );

      await initFilter(config: productConfig);

      if (mounted) {
        _streamSubscription = eventBus.on<EventRefreshProductsList>().listen((
          event,
        ) {
          onRefresh();
        });
        _applyInitValue();
      }
    });
  }

  void _applyInitValue() {
    final productsListFilter = widget.productsListFilter;
    if (productsListFilter != null) {
      minPrice = productsListFilter.minPrice;
      maxPrice = productsListFilter.maxPrice;
      page = productsListFilter.page ?? 1;
      listingLocationId = productsListFilter.listingLocationId;
      include = productsListFilter.include;
      search = productsListFilter.search;
      isSearch = productsListFilter.isSearch;
      applyAttributes(productsListFilter.attributes);

      if (productsListFilter.featured != null) {
        filterSortBy = filterSortBy.applyFeatured(productsListFilter.featured);
      }
      if (productsListFilter.onSale != null) {
        filterSortBy = filterSortBy.applyOnSale(productsListFilter.onSale);
      }
      if (productsListFilter.orderBy != null) {
        filterSortBy = filterSortBy.applyOrderBy(productsListFilter.orderBy);
      }
      if (productsListFilter.order != null) {
        filterSortBy = filterSortBy.applyOrder(productsListFilter.order);
      }
    }

    unawaited(onRefresh());
  }

  @override
  void clearProductList() {
    productModel.setProductsList([]);
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    filterController.dispose();
    super.dispose();
  }

  @override
  Future<void> getProductList({bool forceLoad = false}) async {
    await productModel.getProductsList(
      boostEngine: widget.config?.boostEngine,
      categoryId: categoryIds,
      minPrice: minPrice,
      maxPrice: maxPrice,
      page: page,
      orderBy: filterSortBy.orderByType?.name,
      order: filterSortBy.orderType?.name,
      featured: filterSortBy.featured,
      onSale: filterSortBy.onSale,
      tagId: tagIds,
      attributes: getAttributes(),
      userId: userModel.user?.id,
      listingLocation: listingLocationId,
      include: include,
      search: search,
      brandIds: brandIds,
    );
    Analytics.triggerSearchProduct(
      search,
      productModel.products.isEmpty,
      context,
    );
  }

  void onTapProductCategoryMenu(String? categoryId) {
    // Reset included products
    include = null;

    var selectedCategoryIds = categoryIds;
    if (selectedCategoryIds?.contains(categoryId) ?? false) {
      selectedCategoryIds?.remove(categoryId);
    } else if (categoryId != null) {
      // `ProductCategoryMenu` will be hidden if the selected category number is
      // not equal to 1. Some users do not want this behavior when they select
      // another category item in the list. Therefore, here only a single
      // category filter will be applied. If they want to filter multiple
      // categories on supported platforms, the only way is to open the filter
      // screen.

      // if (allowMultipleCategory) {
      //   selectedCategoryIds?.add(categoryId);
      // } else {
      selectedCategoryIds = [categoryId];
      // }
    }

    onFilter(categoryId: selectedCategoryIds);
  }

  Widget renderProductsLayout({
    List<Product>? products,
    required bool isFetching,
    String? errMsg,
    bool? isEnd,
    double? width,
    required String layout,
  });

  ExpandingBottomSheet? renderBottomSheet() {
    final isOnlyListingType =
        productModel.productsList?.every(
          (product) => product.isListing == true,
        ) ??
        false;

    final enable =
        Services().widget.enableShoppingCart(null) &&
        !isOnlyListingType &&
        kAdvanceConfig.showBottomCornerCart;
    return enable
        ? ExpandingBottomSheet(hideController: filterController)
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AppModel, String>(
      selector: (context, provider) => provider.productListLayout,
      builder: (context, productListLayout, child) {
        // Le Voile: every product listing shows 2 per row. Coerce the
        // single-column layouts (card / listTile) to the 2-column grid so the
        // backdrop opened from the menu / highlights matches the rest of the app.
        final twoColLayout =
            (productListLayout == 'card' || productListLayout == 'listTile')
                ? 'list'
                : productListLayout;
        return ListenableProvider.value(
          value: productModel,
          child: Consumer<ProductModel>(
            builder: (context, model, child) {
              return renderProductsLayout(
                products: model.productsList,
                isFetching: model.isFetching,
                errMsg: model.errMsg,
                isEnd: model.isEnd,
                width: MediaQuery.sizeOf(context).width,
                layout: twoColLayout,
              );
            },
          ),
        );
      },
    );
  }

  @override
  void onCategorySelected(String? name) {
    productModel.categoryName = name;
    _currentTitle = (name?.isNotEmpty ?? false)
        ? '$name'
        : S.of(context).results;
  }

  @override
  void rebuild() {
    setState(() {});
  }

  @override
  void onCloseFilter() {
    filterController.forward();
  }

  /// Need to determine if this share is share only category/tag or share all filter
  /// If it is share only category/tag then only share category/tag - set type as ProductsShareLinkType.other
  /// If it is share all filter then share all filter - set type as ProductsShareLinkType.productsList
  /// Example:
  /// - Share only category/tag:
  /// - Share all filter:
  /// - category: 1,2,3
  /// - tag: 4,5,6
  /// - brand: 7,8,9
  /// - search: "product name"
  /// - attributes: {
  /// "pa_color": "1,2",
  /// "pa_size": "4"
  /// }
  /// - isSearch: true
  /// - include: [1,2,3]
  /// - page: 1
  /// - orderBy: "price"
  /// - order: "asc"
  /// - search: "product name"
  /// - listingLocationId: "location name"
  /// - minPrice: 100
  /// - maxPrice: 1000
  Future<void> shareLink(BuildContext context) async {
    /// Generate product config
    final productConfig = (widget.config ?? ProductConfig.empty()).copyWith();
    productConfig
      ..brandIds = (brandIds?.isEmpty ?? true) ? null : brandIds
      ..category = (categoryIds?.isEmpty ?? true) ? null : categoryIds
      ..order = filterSortBy.orderType?.name
      ..featured = filterSortBy.featured
      ..onSale = filterSortBy.onSale ?? false
      ..include = include
      ..tag = (tagIds?.isEmpty ?? true) ? null : tagIds;

    final attributes = getAttributes();

    /// Generate products list filter
    final productsListFilter = ProductsListFilter(
      minPrice: minPrice,
      maxPrice: maxPrice,
      page: page,
      langCode: appModel.langCode,
      orderBy: filterSortBy.orderByType?.name,
      order: filterSortBy.orderType?.name,
      userId: userModel.user?.id,
      search: search,
      listingLocationId: listingLocationId,
      attributes: attributes.isEmpty ? null : attributes,
      isSearch: isSearch,
      include: include,
      featured: filterSortBy.featured,
      onSale: filterSortBy.onSale,
    );

    var type = ProductsShareLinkType.productsList;
    final isOneCategory = categoryIds != null && categoryIds!.length == 1;
    final isOneTag = tagIds != null && tagIds!.length == 1;
    // If there is only one category and no tag, then share link is filter one
    if (isOneCategory && (tagIds == null || tagIds!.isEmpty)) {
      type = ProductsShareLinkType.filterOne;
    } else if (isOneTag && (categoryIds == null || categoryIds!.isEmpty)) {
      // If there is only one tag and no category, then share link is filter one
      type = ProductsShareLinkType.filterOne;
    }

    // If there is minPrice or maxPrice or search or attributes or isSearch or
    // include or page or orderBy or order or listingLocationId or brandIds or
    // featured or onSale, then share link is products list
    if (minPrice != null && minPrice! > 0) {
      type = ProductsShareLinkType.productsList;
    } else if (maxPrice != null && maxPrice! > 0) {
      type = ProductsShareLinkType.productsList;
    } else if (search?.isNotEmpty ?? false) {
      type = ProductsShareLinkType.productsList;
    } else if (attributes.isNotEmpty) {
      type = ProductsShareLinkType.productsList;
    } else if (isSearch == true) {
      type = ProductsShareLinkType.productsList;
    } else if (include != null && include!.isNotEmpty) {
      type = ProductsShareLinkType.productsList;
    } else if (page > 1) {
      type = ProductsShareLinkType.productsList;
    } else if (orderBy != null && orderBy!.isNotEmpty) {
      type = ProductsShareLinkType.productsList;
    } else if (order != null && order!.isNotEmpty) {
      type = ProductsShareLinkType.productsList;
    } else if (listingLocationId != null && listingLocationId!.isNotEmpty) {
      type = ProductsShareLinkType.productsList;
    } else if (brandIds != null && brandIds!.isNotEmpty) {
      type = ProductsShareLinkType.productsList;
    } else if (featured == true) {
      type = ProductsShareLinkType.productsList;
    } else if (onSale == true) {
      type = ProductsShareLinkType.productsList;
    }

    await shareProductsLink(
      context,
      type: type,
      params: {
        ...productsListFilter.toJson(),
        ...productConfig.toJson(),
        'onSale': onSale, // fix issue override onSale in productConfig
        'featured': featured, // fix issue override featured in productConfig
      },
    );
  }
}
