import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart' show AutoHideKeyboard;
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../models/app_model.dart';
import '../../../models/category/category_model.dart';
import '../../../models/entities/filter_sorty_by.dart';
import '../../../models/fibo_search/index.dart';
import '../../../models/filter_attribute_model.dart';
import '../../../models/product_model.dart';
import '../../../models/search_model.dart';
import '../../../models/tag_model.dart';
import '../../../models/user_model.dart';
import '../../../services/services.dart';
import '../widgets/fibo_search_results.dart';
import '../widgets/recent/recent_search_custom.dart';
import '../widgets/search_box.dart';

class ProductSearchView extends StatefulWidget {
  final bool hasAppBar;
  final Widget builder;
  final Widget? bottomSheet;
  final Widget? titleFilter;
  final Function? onSort;
  final Function onFilter;
  final Function onSearch;
  final bool enableSearchHistory;
  final bool autoFocusSearch;
  final bool? showQRCode;
  final TextEditingController searchFieldController;
  const ProductSearchView({
    required this.builder,
    required this.onSearch,
    this.bottomSheet,
    this.titleFilter,
    this.onSort,
    required this.onFilter,
    this.enableSearchHistory = false,
    this.autoFocusSearch = true,
    this.hasAppBar = false,
    super.key,
    required this.searchFieldController,
    this.showQRCode,
  });

  @override
  State<ProductSearchView> createState() => _ProductSearchViewState();
}

class _ProductSearchViewState extends State<ProductSearchView>
    with AutomaticKeepAliveClientMixin<ProductSearchView> {
  @override
  bool get wantKeepAlive => true;

  final _searchFieldNode = FocusNode();

  // bool isVisibleSearch = false;
  bool _showResult = false;
  List<String>? _suggestSearch;
  FiboSearchResponse? _fiboSearchResponse;
  FiboSearchConfig? _fiboSearchConfig;
  bool _showFiboResults = false;
  bool _isLoadingFiboSearch = false;

  String get _searchKeyword => widget.searchFieldController.text.trim();

  bool get _isFiboSearchEnabled => kSearchConfig.isFiboSearchEnabled;

  List<String> get suggestSearch =>
      _suggestSearch
          ?.where((s) => s.toLowerCase().contains(_searchKeyword.toLowerCase()))
          .toList() ??
      <String>[];

  void _onFocusChange() {
    setState(() {
      if (_searchKeyword.isEmpty && !_searchFieldNode.hasFocus) {
        _showResult = false;
      }
    });

    // Delayed keyboard hide and show
    // Future.delayed(const Duration(milliseconds: 120), () {
    //   setState(() {
    //     isVisibleSearch = _searchFieldNode.hasFocus;
    //   });
    // });
  }

  @override
  void initState() {
    _loadFiboSearchConfig();
    super.initState();
    printLog('[SearchScreen] initState');
    _searchFieldNode.addListener(_onFocusChange);
  }

  Future<void> _loadFiboSearchConfig() async {
    if (_isFiboSearchEnabled) {
      try {
        final config = await Services().api.getFiboSearchConfig();
        if (mounted) {
          setState(() {
            _fiboSearchConfig = config;
          });
        }
      } catch (e) {
        printLog('[FiboSearch] Error loading config: $e');
      }
    }
  }

  @override
  void dispose() {
    printLog('[SearchScreen] dispose');
    _searchFieldNode.dispose();
    super.dispose();
  }

  void _onSearchTextChange(String value) {
    // Fix isssue: Fail to search keyword by category
    //https://github.com/fluxstore/fluxstore-core/pull/1192

    // if (value.isEmpty) {
    //   _showResult = false;
    //   setState(() {});
    //   return;
    // }

    final searchString = value.trim();
    if (_searchFieldNode.hasFocus) {
      if (searchString.isEmpty) {
        setState(() {
          _showResult = false;
          _showFiboResults = false;
          _fiboSearchResponse = null;
        });
        return;
      }

      if (_isFiboSearchEnabled) {
        setState(() {
          _isLoadingFiboSearch = true;
          _showFiboResults = true;
        });

        EasyDebounce.debounce(
          'searchFibo',
          const Duration(milliseconds: 150),
          () async {
            try {
              final response = await Services().api.fiboSearch(
                searchString,
                config: _fiboSearchConfig,
              );
              if (mounted) {
                setState(() {
                  _showResult = false;
                  _fiboSearchResponse = response;
                  _isLoadingFiboSearch = false;
                });

                // Update search keywords
                final productType = context.read<ProductModel>().productType;
                context.read<SearchModel>().updateKeywords(
                  searchString,
                  productType: productType,
                );
              }
            } catch (e) {
              printLog(e);
              if (mounted) {
                setState(() {
                  _isLoadingFiboSearch = false;
                });
              }
            }
          },
        );
      } else {
        if (suggestSearch.isEmpty) {
          setState(() {
            _showResult = true;
            EasyDebounce.debounce(
              'searchCategory',
              const Duration(milliseconds: 200),
              () => widget.onSearch(searchString),
            );
          });
        } else {
          setState(() {
            _showResult = false;
          });
        }
      }
    }
  }

  void _onClearText() {
    setState(() {
      _showResult = false;
      _showFiboResults = false;
      _fiboSearchResponse = null;
      _isLoadingFiboSearch = false;
    });
  }

  Color get labelColor => Colors.black;

  bool get isLoggedIn =>
      Provider.of<UserModel>(context, listen: false).loggedIn;

  Material buildResult() {
    return Material(
      child: Stack(
        children: [
          widget.builder,
          Align(
            alignment: Tools.isRTL(context)
                ? Alignment.bottomLeft
                : Alignment.bottomRight,
            child: widget.bottomSheet,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _suggestSearch =
        Provider.of<AppModel>(context).appConfig?.searchSuggestion ?? [''];

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        top: !widget.hasAppBar,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // _renderHeader(),
            VisibilityDetector(
              onVisibilityChanged: (VisibilityInfo info) {
                if (info.visibleFraction == 0) {
                  _searchFieldNode.unfocus();
                }
              },
              key: const Key('search-box-visibility'),
              child: SearchBox(
                // width: widthSearchBox,
                autoFocus: widget.autoFocusSearch,
                controller: widget.searchFieldController,
                focusNode: _searchFieldNode,
                onChanged: _onSearchTextChange,
                onSubmitted: _onSubmit,
                onCancel: _onClearText,
                showQRCode: widget.showQRCode ?? true,
              ),
            ),
            Expanded(
              child: AutoHideKeyboard(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    child: _showResult
                        ? buildResult()
                        : Align(
                            alignment: Alignment.topCenter,
                            child: Consumer<TagModel>(
                              builder: (context, tagModel, child) {
                                return Consumer<CategoryModel>(
                                  builder: (context, categoryModel, child) {
                                    return Consumer<FilterAttributeModel>(
                                      builder:
                                          (context, attributeModel, child) {
                                            var child = _buildRecentSearch();

                                            if ((_isFiboSearchEnabled &&
                                                    _showFiboResults) ||
                                                suggestSearch.isNotEmpty) {
                                              child = _buildSuggestions();
                                            }

                                            return child;
                                          },
                                    );
                                  },
                                );
                              },
                            ),
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

  Widget _buildRecentSearch() {
    return RecentSearchesCustom(onTap: _onSubmit);
  }

  Widget _buildSuggestions() {
    if (_isFiboSearchEnabled && _showFiboResults) {
      if (_searchKeyword.isEmpty) {
        return const SizedBox();
      }

      if (_isLoadingFiboSearch) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: kLoadingWidget(),
          ),
        );
      }

      if (_fiboSearchResponse == null || _fiboSearchConfig == null) {
        return const SizedBox();
      }

      return FiboSearchResults(
        searchResponse: _fiboSearchResponse!,
        config: _fiboSearchConfig!,
        onSubmit: _onSubmit,
      );
    }

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Theme.of(context).primaryColorLight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 10, right: 10),
        itemCount: suggestSearch.length,
        itemBuilder: (_, index) {
          final keyword = suggestSearch[index];

          if (index == 0 && suggestSearch.length > 1) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                keyword,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValueOpacity(0.5),
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () => _onSubmit(keyword),
            child: ListTile(title: Text(keyword)),
          );
        },
      ),
    );
  }

  void _onSubmit(String name) {
    final searchString = name.trim();
    if (searchString.isEmpty) {
      return;
    }

    final productType = context.read<ProductModel>().productType;

    context.read<SearchModel>().updateKeywords(
      searchString,
      productType: productType,
    );

    widget.searchFieldController.text = searchString;

    if (_isFiboSearchEnabled) {
      widget.onFilter(
        search: searchString,
        sortBy: const FilterSortBy(orderByType: OrderByType.relevance),
        isSearch: true,
      );

      setState(() {
        _showResult = true;
      });
    } else {
      EasyDebounce.debounce(
        'searchCategory',
        const Duration(milliseconds: 200),
        () {
          widget.onSearch(searchString);
          if (mounted) {
            setState(() {
              _showResult = true;
            });
          }
        },
      );
    }

    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
