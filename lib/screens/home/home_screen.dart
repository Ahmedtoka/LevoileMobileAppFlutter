import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../common/config.dart';
import '../../common/constants.dart';
import '../../data/boxes.dart';
import '../../models/app_model.dart';
import '../../modules/dynamic_layout/helper/helper.dart';
import '../../modules/dynamic_layout/index.dart';
import '../../widgets/home/index.dart';
import '../base_screen.dart';
import '../../services/popup_service.dart';
import '../custom/coupon_welcome_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({this.scrollController});

  final ScrollController? scrollController;

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseScreen<HomeScreen> {
  ValueNotifier<double> offsetNotifier = ValueNotifier(0);

  @override
  void dispose() {
    printLog('[Home] dispose');
    super.dispose();
  }

  @override
  void initState() {
    printLog('[Home] initState');
    super.initState();
    // Show the welcome-coupon popup once, after the home page appears.
    // Uses the global navigator so switching tabs doesn't cancel it.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Coupon welcome popup first, then any dashboard announcement popups.
      await WelcomeCouponFlow.maybeShow(App.fluxStoreNavigatorKey);
      final ctx = App.fluxStoreNavigatorKey.currentContext;
      if (ctx != null) {
        await PopupService.instance.maybeShowFor('home', ctx);
      }
    });
  }

  void afterClosePopup(int updatedTime) {
    SettingsBox().popupBannerLastUpdatedTime = updatedTime;
  }

  @override
  Widget build(BuildContext context) {
    printLog('[Home] build');

    return Selector<AppModel, (AppConfig?, String, String?)>(
      selector: (_, model) =>
          (model.appConfig, model.langCode, model.countryCode),
      builder: (_, value, child) {
        final appConfig = value.$1;
        final langCode = value.$2;
        final countryCode = value.$3;

        if (appConfig == null) {
          return kLoadingWidget(context);
        }

        final isStickyHeader = appConfig.settings.stickyHeader;
        final horizontalLayoutList = List.from(
          appConfig.jsonData['HorizonLayout'],
        );
        final isShowAppbar =
            horizontalLayoutList.isNotEmpty &&
            horizontalLayoutList.first['layout'] == 'logo';

        final bannerConfig = appConfig.settings.smartEngagementBannerConfig;

        final isShowPopupBanner =
            (SettingsBox().popupBannerLastUpdatedTime !=
                bannerConfig.popup.updatedTime) ||
            bannerConfig.popup.alwaysShowUponOpen;

        final backgroundConfig = appConfig.background;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (backgroundConfig?.isScrollable != true) {
                return false;
              }
              if (scrollNotification is ScrollUpdateNotification) {
                final value = scrollNotification.metrics.pixels;
                if (value < 0) {
                  offsetNotifier.value = 0;
                } else {
                  offsetNotifier.value = value;
                }
              }
              return true;
            },
            child: Stack(
              children: <Widget>[
                if (backgroundConfig != null &&
                    Layout.isDisplayDesktop(context) == false)
                  ValueListenableBuilder<double>(
                    valueListenable: offsetNotifier,
                    builder: (context, offset, child) {
                      return Positioned(
                        top: -offset,
                        left: 0,
                        right: 0,
                        child: isStickyHeader
                            ? SafeArea(
                                child: HomeBackground(config: backgroundConfig),
                              )
                            : HomeBackground(config: backgroundConfig),
                      );
                    },
                  ),

                HomeLayout(
                  isPinAppBar: isStickyHeader,
                  isShowAppbar: isShowAppbar,
                  showNewAppBar:
                      appConfig.appBar?.shouldShowOn(RouteList.home) ?? false,
                  configs: appConfig.jsonData,
                  key: Key('$langCode$countryCode'),
                  scrollController: widget.scrollController,
                ),
                if (App.fluxStoreNavigatorKey.currentContext != null)
                  SmartEngagementBanner(
                    context: App.fluxStoreNavigatorKey.currentContext!,
                    config: bannerConfig,
                    enablePopup: isShowPopupBanner,
                    afterClosePopup: () {
                      afterClosePopup(bannerConfig.popup.updatedTime);
                    },
                    childWidget: (data) {
                      return DynamicLayout(configLayout: data);
                    },
                  ),
                // Remove `WrapStatusBar` because we already have `SafeArea`
                // inside `HomeLayout`
                // const WrapStatusBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
