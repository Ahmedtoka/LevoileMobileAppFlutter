import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/icons/constants.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../models/app_model.dart';
import '../../models/cart/cart_base.dart';
import '../../models/entities/back_drop_arguments.dart';
import '../../models/notification_model.dart';
import '../../modules/dynamic_layout/dynamic_layout.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
// Le Voile: the pinned announcement strip.
import '../../modules/dynamic_layout/lv/ticker_bar.dart';
import '../../modules/multi_site/multi_site_factory.dart';
import '../../routes/flux_navigate.dart';
import '../../screens/common/app_bar_mixin.dart';
import '../../services/index.dart';
import '../common/dialogs.dart';
import '../web_layout/web_layout.dart';
import 'preview_overlay.dart';

class HomeLayout extends StatefulWidget {
  final configs;
  final bool isPinAppBar;
  final bool isShowAppbar;
  final bool showNewAppBar;
  final bool enableRefresh;
  final ScrollController? scrollController;

  const HomeLayout({
    this.configs,
    this.isPinAppBar = false,
    this.isShowAppbar = true,
    this.showNewAppBar = false,
    this.enableRefresh = true,
    this.scrollController,
    super.key,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with AppBarMixin {
  AnimatedItemListConfig? _animatedConfig;

  late List widgetData;
  dynamic verticalWidgetData;
  var _useNestedScrollView = true;

  bool isPreviewingAppBar = false;

  bool cleanCache = false;
  bool get isDisplayDesktop => Layout.isDisplayDesktop(context);

  @override
  void initState() {
    /// init config data
    widgetData = List<Map<String, dynamic>>.from(
      widget.configs['HorizonLayout'],
    );
    // Le Voile: `!_isLvTicker` guard added.
    //
    // This drops the FIRST block on the assumption that it is the `logo` one,
    // already drawn as the app bar. `isShowAppbar` is set from
    // `horizonLayout.first['layout'] == 'logo'` (home_screen.dart), so today
    // the two always agree — but the ticker is emitted BEFORE the logo, and if
    // that ever changed, this line would silently delete the announcement strip
    // with no visible error. Never remove a ticker here.
    if (widgetData.isNotEmpty &&
        widget.isShowAppbar &&
        !widget.showNewAppBar &&
        !_isLvTicker(widgetData.first)) {
      widgetData.removeAt(0);
    }
    final tabBarConfig = widget.configs['TabBar'];
    if (tabBarConfig != null && tabBarConfig is List) {
      final homeConfig = tabBarConfig.firstWhereOrNull(
        (element) => element['layout'] == 'home',
      );

      _animatedConfig = AnimatedItemListConfig.tryParse(
        homeConfig?['animationConfig'],
        groupKey: 'home_grp',
      );
    }

    /// init single vertical layout
    if (widget.configs['VerticalLayout'] != null &&
        widget.configs['VerticalLayout'].isNotEmpty) {
      Map verticalData = Map<String, dynamic>.from(
        widget.configs['VerticalLayout'],
      );
      verticalData['type'] = 'vertical';
      verticalWidgetData = verticalData;
    }

    super.initState();
  }

  @override
  void didUpdateWidget(HomeLayout oldWidget) {
    if (oldWidget.configs != widget.configs) {
      /// init config data
      List data = List<Map<String, dynamic>>.from(
        widget.configs['HorizonLayout'],
      );
      if (data.isNotEmpty && widget.isShowAppbar && !widget.showNewAppBar) {
        data.removeAt(0);
      }
      widgetData = data;

      /// init vertical layout
      if (widget.configs['VerticalLayout'] != null) {
        Map verticalData = Map<String, dynamic>.from(
          widget.configs['VerticalLayout'],
        );
        verticalData['type'] = 'vertical';
        verticalWidgetData = verticalData;
      }
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> onRefresh() async {
    /// No need refreshBlogs anymore because we will reload appConfig like below
    // await Provider.of<ListBlogModel>(context, listen: false).refreshBlogs();

    // refresh the product request and clean up cache
    setState(() => cleanCache = true);
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    setState(() => cleanCache = false);

    var appModel = Provider.of<AppModel>(context, listen: false);
    final oldAppConfig = appModel.appConfig;

    // reload app config will refresh all tabs in tabbar, not only home screen
    final newAppconfig = await appModel.loadAppConfig(config: kLayoutConfig);

    // Show a popup if there is a big difference in config
    if (newAppconfig?.tabBar.length != oldAppConfig?.tabBar.length) {
      await showDialogNewAppConfig(context);
    }
  }

  Widget renderAppBar() {
    if (Layout.isDisplayDesktop(context)) {
      return const SliverToBoxAdapter();
    }

    List<dynamic> horizonLayout = widget.configs['HorizonLayout'] ?? [];
    Map logoConfig = horizonLayout.firstWhere(
      (element) => element['layout'] == 'logo',
      orElse: () => Map<String, dynamic>.from({}),
    );
    var config = LogoConfig.fromJson(logoConfig);

    /// customize theme
    // config
    //   ..opacity = 0.9
    //   ..iconBackground = HexColor('DDDDDD')
    //   ..iconColor = HexColor('330000')
    //   ..iconOpacity = 0.8
    //   ..iconRadius = 40
    //   ..iconSize = 24
    //   ..cartIcon = MenuIcon(name: 'cart')
    //   ..showSearch = false
    //   ..showLogo = true
    //   ..showCart = true
    //   ..showMenu = true;

    return SliverAppBar(
      pinned: widget.isPinAppBar,
      snap: true,
      floating: true,
      titleSpacing: 0,
      elevation: 0,
      forceElevated: true,
      backgroundColor:
          config.color ??
          Theme.of(
            context,
          ).colorScheme.surface.withValueOpacity(config.opacity),
      title: PreviewOverlay(
        index: 0,
        config: logoConfig as Map<String, dynamic>?,
        builder: (value) {
          final appModel = Provider.of<AppModel>(context, listen: true);
          return Selector<CartModel, int>(
            selector: (_, cartModel) => cartModel.totalCartQuantity,
            builder: (context, totalCart, child) {
              return Selector<NotificationModel, int>(
                selector: (context, notificationModel) =>
                    notificationModel.unreadCount,
                builder: (context, unreadCount, child) {
                  return LogoWidget(
                    config: config,
                    logo: appModel.themeConfig.logo,
                    notificationCount: unreadCount,
                    totalCart: totalCart,
                    multiSiteArgument: MultiSiteFactory.instance.createArgument(
                      context,
                    ),
                    onSearch: () {
                      FluxNavigate.pushNamed(
                        RouteList.homeSearch,
                        arguments: BackDropArguments(config: logoConfig),
                        context: context,
                      );
                    },
                    onCheckout: () {
                      FluxNavigate.pushNamed(RouteList.cart, context: context);
                    },
                    onTapNotifications: () {
                      FluxNavigate.pushNamed(
                        RouteList.notify,
                        context: context,
                      );
                    },
                    onTapDrawerMenu: () =>
                        NavigateTools.onTapOpenDrawerMenu(context),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    AnimatedItemList.destroy(_animatedConfig?.groupKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.configs == null) return const SizedBox();

    ErrorWidget.builder = (error) {
      if (foundation.kReleaseMode) {
        return const SizedBox();
      }
      return Container(
        constraints: const BoxConstraints(minHeight: 150),
        decoration: BoxDecoration(
          color: Colors.lightBlue.withValueOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        /// Hide error, if you're developer, enable it to fix error it has
        child: Center(child: Text('Error in ${error.exceptionAsString()}')),
      );
    };
    if (horizontalLayouts.length == 1 && widget.enableRefresh) {
      _useNestedScrollView = false;
    }

    if (isDisplayDesktop) {
      return SafeArea(
        bottom: false,
        child: SliverWebLayout(
          slivers: horizontalLayouts,
          scrollController: widget.scrollController,
          physics: const BouncingScrollPhysics(),
        ),
      );
    }

    return SafeArea(
      bottom: false,
      child: verticalWidgetData == null
          ? CustomScrollView(
              cacheExtent: 2000,
              slivers: horizontalLayouts,
              controller: widget.scrollController,
              physics: const BouncingScrollPhysics(),
            )
          : horizontalLayouts.isNotEmpty
          ? NestedScrollView(
              controller: widget.scrollController,
              headerSliverBuilder: (context, _) {
                return horizontalLayouts;
              },
              body: verticalLayout,
            )
          : verticalLayout,
    );
  }

  /// Le Voile: the announcement strip's config, if the dashboard sent one.
  ///
  /// It is a HorizonLayout block like any other, so by default it scrolled away
  /// with the page. The design wants it pinned, so it is pulled out here and
  /// emitted as a SliverPersistentHeader instead — and skipped inside the
  /// SliverList below. Returns null when there is nothing to show, so an
  /// empty ticker never reserves a blank band.
  Map<String, dynamic>? get _lvTickerConfig {
    for (final config in widgetData) {
      if (config is! Map || config['layout'] != 'lvTicker') continue;

      final messages = (config['messages'] as List?) ?? const [];
      if (messages.any((m) => m.toString().trim().isNotEmpty)) {
        return Map<String, dynamic>.from(config);
      }
    }

    return null;
  }

  static bool _isLvTicker(dynamic config) =>
      config is Map && config['layout'] == 'lvTicker';

  List<Widget> get horizontalLayouts => <Widget>[
    if (widget.showNewAppBar && !isDisplayDesktop) sliverAppBarWidget,
    if (widget.isShowAppbar && !widget.showNewAppBar && !isDisplayDesktop)
      renderAppBar(),
    if (widget.enableRefresh)
      CupertinoSliverRefreshControl(
        onRefresh: onRefresh,
        refreshTriggerPullDistance: 175,
      ),
    // Le Voile: pinned, so the announcements stay on screen while scrolling.
    // After the refresh control so pull-to-refresh still owns the overscroll.
    if (_lvTickerConfig != null)
      SliverPersistentHeader(
        pinned: true,
        delegate: LvTickerHeaderDelegate(config: _lvTickerConfig!),
      ),
    if (widgetData.isNotEmpty)
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          var config = widgetData[index];

          // Le Voile: already drawn as the pinned header above. Skipped rather
          // than filtered out of widgetData so the indexes below — and the
          // preview overlay's — keep lining up with the config.
          if (_isLvTicker(config)) return const SizedBox.shrink();

          /// if show app bar, the preview should plus +1
          var previewIndex = widget.isShowAppbar ? index + 1 : index;
          Widget body = PreviewOverlay(
            index: previewIndex,
            config: config,
            builder: (value) {
              return ConditionBuilderWidget(
                condition: _animatedConfig == null,
                child: DynamicLayout(
                  configLayout: value,
                  cleanCache: cleanCache,
                ),
                elseBuilder: (child) => AnimatedItemList(
                  keyItem: 'keyItem$index',
                  config: _animatedConfig!,
                  child: child,
                ),
              );
            },
          );

          /// Use row to limit the drawing area.
          /// If you delete the row, setting the size for the body will not work.
          return LayoutBuilder(
            builder: (_, constraints) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth < kLimitWidthScreen
                        ? constraints.maxWidth
                        : kLimitWidthScreen,
                  ),
                  child: body,
                ),
              ],
            ),
          );
        }, childCount: widgetData.length),
      ),
  ];

  Widget get verticalLayout => PreviewOverlay(
    index: widgetData.length,
    config: verticalWidgetData,
    builder: (value) {
      return Services().widget.renderVerticalLayout(
        value,
        horizontalLayouts.isEmpty || _useNestedScrollView == false,
        onRefresh: widget.enableRefresh && _useNestedScrollView == false
            ? onRefresh
            : null,
      );
    },
  );
}
