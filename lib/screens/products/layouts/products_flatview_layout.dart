import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';

import '../../../common/constants.dart';
import '../../../models/index.dart';
import '../../../services/service_config.dart';
import '../../../widgets/asymmetric/asymmetric_view.dart';
import '../../../widgets/product/product_list.dart';
import '../filter_mixin/products_filter_mixin.dart';
import '../products_flatview.dart';
import '../widgets/category_menu.dart';
import 'products_layout.dart';

class ProductsFlatviewLayout extends ProductsLayout {
  const ProductsFlatviewLayout({
    super.key,
    super.products,
    super.config,
    super.countdownDuration,
    super.autoFocusSearch,
    super.productsListFilter,
    this.allowFilterMultipleCategory = true,
    this.enableProductListCategoryMenu = true,
    this.categoryMenuStyle,
    required this.categoryMenuShowDepth,
  });

  final bool allowFilterMultipleCategory;
  final bool enableProductListCategoryMenu;
  final ProductCategoryMenuStyle? categoryMenuStyle;

  /// Only support ProductCategoryMenuStyle.tab
  final bool categoryMenuShowDepth;

  @override
  StateProductsFlatviewLayout createState() => StateProductsFlatviewLayout();
}

class StateProductsFlatviewLayout<T extends ProductsFlatviewLayout>
    extends StateProductLayout<T> {
  final searchFieldController = TextEditingController();
  final categoryMenuDelegate = CategoryMenuDelegate();

  bool _isFirstLoad = true;

  bool get hasBackCategory =>
      categoryMenuDelegate.onGetIdCategoryParent != null &&
      stackSelectedCategory.isNotEmpty &&
      widget.allowFilterMultipleCategory == false &&
      widget.enableProductListCategoryMenu;

  bool get useCategoryTab => categoryMenuStyle.isTab;
  ProductCategoryMenuStyle get categoryMenuStyle =>
      widget.categoryMenuStyle ?? ProductCategoryMenuStyle.menu;
  bool get categoryMenuShowDepth =>
      widget.categoryMenuShowDepth && useCategoryTab;

  // This value depends on the config in ServerConfig (check according to
  // framework) and can be turned on or off manually through the
  // variable allowFilterMultipleCategory
  @override
  bool get allowMultipleCategory =>
      ServerConfig().allowMultipleCategory &&
      widget.allowFilterMultipleCategory;

  @override
  bool get showTagCategoryImage =>
      widget.enableProductListCategoryMenu == false || allowMultipleCategory;

  @override
  void dispose() {
    searchFieldController.dispose();
    super.dispose();
  }

  @override
  void onClearTextSearch() {
    searchFieldController.clear();
  }

  void onSearch(String searchText) {
    onFilter(
      minPrice: minPrice,
      maxPrice: maxPrice,
      categoryId: categoryIds,
      tagId: tagIds,
      brandIds: brandIds,
      listingLocationId: listingLocationId,
      search: searchText,
      isSearch: true,
    );
  }

  Widget renderHeaderCategoryMenu() {
    final selectedCategories = categoryIds ?? <String>[];
    if (_isFirstLoad &&
        selectedCategories.length == 1 &&
        showCategory == false) {
      final ctgId = selectedCategories.first;

      onToogleCategory(
        categoryId: ctgId,
        parentCategoryId: categoryModel.getIdParentCategories(ctgId),
      );

      _isFirstLoad = false;
    } else if (selectedCategories.isNotEmpty && widget.categoryMenuShowDepth) {
      final ctgId = selectedCategories.first;

      ///
      updateStack(ctgId, categoryModel.getIdParentCategories(ctgId));
    }

    return ProductCategoryMenu(
      imageLayout: true,
      selectedCategories: categoryIds,
      onTap: onTapProductCategoryMenu,
      categoryMenuDelegate: categoryMenuDelegate,
      style: categoryMenuStyle,
      getStackSelectedCategory: () => stackSelectedCategory,
      categoryMenuShowDepth: categoryMenuShowDepth,
      onPush: (String? categoryId, String? parentCategoryId, bool hasChild) {
        onToogleCategory(
          categoryId: categoryId,
          parentCategoryId: parentCategoryId,
          hasChild: hasChild,
          jumpStep: categoryMenuShowDepth,
        );
      },
    );
  }

  Widget renderProductsList({
    List<Product>? products,
    required bool isFetching,
    String? errMsg,
    bool? isEnd,
    double? width,
    required String layout,
  }) {
    return layout.isListView
        ? ProductList(
            products: products,
            onRefresh: onRefresh,
            onLoadMore: onLoadMore,
            isFetching: isFetching,
            errMsg: errMsg,
            isEnd: isEnd,
            layout: layout,
            ratioProductImage: ratioProductImage,
            productListItemHeight: productListItemHeight,
            animationConfig: widget.config?.animationConfig,
            width: width,
            // Le Voile: clean category page — no filter bar, no category-name
            // title/count section. Just the search header + the 2-column grid.
            appbar: null,
            header: const <Widget>[SizedBox(height: 8)],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              renderHeaderCategoryMenu(),
              if (useCategoryTab) ...[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: renderFilterTitle(context),
                ),
              ],
              Expanded(
                child: AsymmetricView(
                  products: products,
                  isFetching: isFetching,
                  isEnd: isEnd,
                  onLoadMore: onLoadMore,
                  width: width,
                ),
              ),
            ],
          );
  }

  Widget? renderTitleFilter(String layout) {
    return layout.isListView
        ? null
        : useCategoryTab
        ? null
        : renderFilters(context);
  }

  bool _onBackWithCategory() {
    final stackCategory = onToogleCategory(jumpStep: categoryMenuShowDepth);
    if (stackCategory?.isNotEmpty ?? false) {
      onFilter(categoryId: [stackCategory!]);
      return true;
    }

    return false;
  }

  void _onBack() {
    if (_onBackWithCategory() == false) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget renderProductsLayout({
    List<Product>? products,
    required bool isFetching,
    String? errMsg,
    bool? isEnd,
    double? width,
    required String layout,
  }) {
    return WillPopScopeWidget(
      onWillPop: () async {
        return _onBackWithCategory() == false;
      },
      child: renderScaffold(
        routeName: RouteList.backdrop,
        resizeToAvoidBottomInset: false,
        disableSafeArea: true,
        child: ProductFlatView(
          searchFieldController: searchFieldController,
          hasAppBar: hasAppBar,
          autoFocusSearch: widget.autoFocusSearch,
          onBack: hasBackCategory ? _onBack : null,
          builder: renderProductsList(
            products: products,
            isFetching: isFetching,
            errMsg: errMsg,
            isEnd: isEnd,
            width: width,
            layout: layout,
          ),
          onShare: () => shareLink(context),
          // Le Voile: no filter, no category-name title, no floating cart
          // (the cart lives in the footer). Just back + search + the grid.
          titleFilter: null,
          onFilter: null,
          onSearch: onSearch,
          bottomSheet: null,
          categoriesOptionalBuilder: null,
        ),
      ),
    );
  }
}
