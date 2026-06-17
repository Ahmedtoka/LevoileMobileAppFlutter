import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../models/index.dart';

const kWidthCategoriesOptionalBuilder = 120.0;

class ProductFlatView extends StatefulWidget {
  final Widget builder;
  final Widget? bottomSheet;
  final Widget? titleFilter;
  final Function? onSort;
  final Function? onFilter;
  final Function onSearch;
  final bool autoFocusSearch;
  final bool hasAppBar;
  final TextEditingController searchFieldController;
  final void Function()? onBack;
  final Widget Function(double width)? categoriesOptionalBuilder;
  final void Function()? onShare;

  const ProductFlatView({
    required this.builder,
    required this.onSearch,
    this.bottomSheet,
    this.titleFilter,
    this.onSort,
    this.onFilter,
    this.autoFocusSearch = true,
    this.hasAppBar = false,
    super.key,
    required this.searchFieldController,
    this.onBack,
    this.categoriesOptionalBuilder,
    this.onShare,
  });

  @override
  State<ProductFlatView> createState() => _ProductFlatViewState();
}

class _ProductFlatViewState extends State<ProductFlatView>
    with TickerProviderStateMixin {
  Color get labelColor => Colors.black;
  late AnimationController _animatedController;
  late Animation<double> _animation;
  bool get _isActiveAnimationUI => widget.categoriesOptionalBuilder != null;
  final FocusNode _focusNode = FocusNode();

  bool get isLoggedIn =>
      Provider.of<UserModel>(context, listen: false).loggedIn;

  Widget _buildMoreWidget(bool loggedIn) {
    // Le Voile: the 3-dots overflow menu is removed from the product
    // listing header for a cleaner, store-review-friendly UI.
    return const SizedBox.shrink();
  }

  void onSearch(String value) {
    final searchedString = value.trim();
    EasyDebounce.debounce(
      'searchCategory',
      const Duration(milliseconds: 200),
      () => widget.onSearch(searchedString),
    );
  }

  Widget _getStickyWidget() {
    if (widget.titleFilter == null) return const SizedBox();

    return Container(
      alignment: Alignment.center,
      height: 44,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 1), blurRadius: 2),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: widget.titleFilter,
    );
  }

  void _onBack() {
    if (widget.onBack != null) {
      widget.onBack?.call();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus == false) {
      _animatedController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _animatedController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animatedController,
      curve: Curves.easeInOut,
    );
    if (_isActiveAnimationUI) {
      _focusNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    _animatedController.dispose();

    if (_isActiveAnimationUI) {
      _focusNode.removeListener(_onFocusChange);
    }

    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          AppBar(
            primary: !widget.hasAppBar,
            titleSpacing: 0,
            backgroundColor: Theme.of(context).colorScheme.surface,
            leading: Navigator.of(context).canPop() || widget.onBack != null
                ? CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: _onBack,
                    child: const Icon(CupertinoIcons.back),
                  )
                : null,
            title: Padding(
              padding: EdgeInsets.only(
                left: Navigator.of(context).canPop() ? 0 : 15,
              ),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final animatedValue = _animation.value;
                  final showSearch =
                      animatedValue == 1 || _isActiveAnimationUI == false;

                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            if (widget.categoriesOptionalBuilder != null)
                              SizedBox(
                                width:
                                    (1 - animatedValue) *
                                    kWidthCategoriesOptionalBuilder,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  child: widget.categoriesOptionalBuilder!(
                                    kWidthCategoriesOptionalBuilder,
                                  ),
                                ),
                              ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: _renderSearch(showSearch),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (widget.onFilter != null) ...[
                        const SizedBox(width: 4),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: IconButton(
                            onPressed: () => widget.onFilter!(),
                            icon: Icon(
                              Icons.filter_alt_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
            actions: [
              Selector<UserModel, bool>(
                selector: (context, provider) => provider.loggedIn,
                builder: (context, loggedIn, child) {
                  return _buildMoreWidget(loggedIn);
                },
              ),
              const SizedBox(width: 4),
            ],
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _focusNode.unfocus();
                _animatedController.reverse();
              },
              behavior: HitTestBehavior.opaque,
              child: Stack(
                children: [
                  Column(
                    children: [
                      _getStickyWidget(),
                      Expanded(child: widget.builder),
                    ],
                  ),
                  Align(
                    alignment: Tools.isRTL(context)
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    // Keep the floating cart above the system navigation bar.
                    child: widget.bottomSheet == null
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewPadding.bottom,
                            ),
                            child: widget.bottomSheet,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedSize _renderSearch(bool showSearch) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.center,
      curve: Curves.easeInOut,
      child: SizedBox(
        width: showSearch ? double.infinity : 35,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: showSearch
              ? CupertinoSearchTextField(
                  controller: widget.searchFieldController,
                  autofocus: false,
                  focusNode: _focusNode,
                  onChanged: onSearch,
                  onSubmitted: onSearch,
                  onTap: _animatedController.forward,
                  placeholder: S.of(context).searchForItems,
                  // Le Voile: branded search field (subtle magenta tint +
                  // brand icon) instead of the default iOS grey box.
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                  itemColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.bodySmall,
                  placeholderStyle: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: Theme.of(context).hintColor),
                )
              : GestureDetector(
                  onTap: _animatedController.forward,
                  child: SizedBox(
                    height: 30,
                    width: 25,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            CupertinoIcons.search,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        if (widget.searchFieldController.text.isNotEmpty)
                          PositionedDirectional(
                            end: 0,
                            top: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(
                                Icons.edit_outlined,
                                size: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
