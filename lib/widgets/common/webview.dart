import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:provider/provider.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/events.dart';
import '../../common/tools.dart';
import '../../models/user_model.dart';
import '../../routes/flux_navigate.dart';
import '../../services/service_config.dart';
import 'empty_state_widget.dart';
import 'webview/webview.dart';
import 'webview/webview_interface.dart';

class WebView extends StatelessWidget with WebviewMixin {
  late final String data;
  late final bool isHTML;
  final String? title;
  final AppBar? appBar;
  final bool enableForward;
  final bool enableBackward;
  final bool enableClose;
  final Future<bool> Function(String url)? shouldPreventNavigator;
  final Function(String url)? onPageFinished;
  final Function? onClosed;
  final String script;
  final Map<String, String>? headers;
  final String? routeName;
  final bool hideNewAppBar;
  final bool showAppBar;
  final bool showLoading;
  final bool requiredLogin;
  final bool allowVerticalScroll;
  final bool allowHorizontalScroll;
  final WebViewDelegateController? webViewDelegateController;

  /// Le Voile: send a tap on the WEB shop's basket to the app's own cart
  /// instead of loading it.
  ///
  /// Content webviews — a banner, a menu page, a product link — put a real
  /// browser session on the shop domain inside the app, and that session
  /// carries its own Shopify cart cookie. A customer who tapped through to it
  /// was shown a second basket with a different total from the one in the
  /// app, and a Check Out button that skipped the app entirely.
  ///
  /// Off by default, and deliberately NOT passed by the checkout webview,
  /// which must be free to load the very URLs this blocks.
  final bool redirectStoreCartToApp;

  WebView(
    String url, {
    super.key,
    this.title,
    this.appBar,
    this.shouldPreventNavigator,
    this.onPageFinished,
    this.onClosed,
    this.script = '',
    this.headers,
    this.enableForward = true,
    this.enableBackward = true,
    this.enableClose = true,
    this.routeName,
    this.hideNewAppBar = false,
    this.showAppBar = true,
    this.showLoading = true,
    this.requiredLogin = false,
    this.allowVerticalScroll = true,
    this.allowHorizontalScroll = false,
    this.webViewDelegateController,
    this.redirectStoreCartToApp = false,
  }) {
    data = url;
    isHTML = false;
  }

  WebView.html(
    String html, {
    super.key,
    this.title,
    this.appBar,
    this.shouldPreventNavigator,
    this.onPageFinished,
    this.onClosed,
    this.script = '',
    this.headers,
    this.enableForward = true,
    this.enableBackward = true,
    this.enableClose = true,
    this.routeName,
    this.hideNewAppBar = false,
    this.showAppBar = true,
    this.showLoading = true,
    this.requiredLogin = false,
    this.allowVerticalScroll = true,
    this.allowHorizontalScroll = false,
    this.webViewDelegateController,
    this.redirectStoreCartToApp = false,
  }) {
    data = html;
    isHTML = true;
  }

  String? get url => isHTML ? null : data;

  String? get html => isHTML ? data : null;

  @override
  Widget build(BuildContext context) {
    printLog('[WebView open]: $data');
    if ((url?.isEmpty ?? true) && (html?.isEmpty ?? true)) {
      return EmptyStateWidget(
        title: S.of(context).invalidUrl,
        image: kInvalidUrl,
        color: Theme.of(context).colorScheme.onSurface,
      );
    }
    // UserModel may not be provided in Manager/Delivery apps, so keep it nullable.
    final userModel = context.read<UserModel?>();
    if (userModel == null) return _buildWebViewWithCookie(context, null);

    return Selector<UserModel, String?>(
      selector: (context, model) => model.user?.cookie,
      shouldRebuild: (prev, next) => prev != next,
      builder: (context, cookie, child) {
        if (requiredLogin && cookie == null) {
          return EmptyStateWidget(
            title: S.of(context).loginToContinue,
            image: kRequiredLogin,
            color: Theme.of(context).colorScheme.onSurface,
            buttonText: S.of(context).login,
            onPressed: () => eventBus.fire(
              const EventExpiredCookie(
                isRequiredLogin: true,
                skipDuplicateCheck: true,
              ),
            ),
          );
        }
        return _buildWebViewWithCookie(context, cookie);
      },
    );
  }

  /// Le Voile: the navigation gate this webview runs every URL through.
  ///
  /// Wraps whatever gate was already in force rather than replacing it, so
  /// the internal/external domain rules keep applying underneath; the basket
  /// check only ever adds a reason to stop.
  Future<bool> Function(String) _navigationGuard(BuildContext context) {
    final inherited = shouldPreventNavigator ?? shouldPreventWebNavigation;
    if (!redirectStoreCartToApp) {
      return inherited;
    }

    return (String url) async {
      if (WebviewMixin.isStoreCartUrl(url)) {
        printLog('[WebView] web shop basket blocked, opening app cart: $url');
        if (context.mounted) {
          // Not awaited: this has to answer the webview's navigation
          // question now, and the answer does not depend on how long the
          // customer then spends in the cart.
          unawaited(FluxNavigate.pushNamed(RouteList.cart, context: context));
        }
        return true;
      }
      return inherited(url);
    };
  }

  Widget _buildWebViewWithCookie(BuildContext context, String? cookie) {
    if (isHTML) {
      return _buildWebView(context, html: html);
    }

    if (ServerConfig().isWooType || ServerConfig().isWordPress) {
      return _buildWebView(context, url: url?.addWooCookieToUrl(cookie));
    }

    return _buildWebView(context, url: url);
  }

  Widget _buildWebView(BuildContext context, {String? url, String? html}) {
    final navigationGuard = _navigationGuard(context);
    if (kIsWeb) {
      return WebviewWeb(
        url: url,
        data: html,
        title: title,
        routeName: routeName,
        shouldPreventNavigator: navigationGuard,
        enableForward: enableForward,
        enableBackward: enableBackward,
        enableClose: enableClose,
        onClosed: onClosed,
        appBar: appBar,
        showLoading: showLoading,
        showAppBar: showAppBar,
        hideNewAppBar: hideNewAppBar,
        allowVerticalScroll: allowVerticalScroll,
        allowHorizontalScroll: allowHorizontalScroll,
        webViewDelegateController: webViewDelegateController,
      );
    }

    if (isWindows || isMacOS) {
      return WebViewDesktop(
        url: url,
        data: html,
        title: title,
        routeName: routeName,
        shouldPreventNavigator: navigationGuard,
        script: script.isEmptyOrNull ? kWebViewConfig.webViewScript : script,
        headers: headers,
        enableForward: enableForward,
        enableBackward: enableBackward,
        enableClose: enableClose,
        onClosed: onClosed,
        appBar: appBar,
        showLoading: showLoading,
        showAppBar: showAppBar,
        hideNewAppBar: hideNewAppBar,
        allowVerticalScroll: allowVerticalScroll,
        allowHorizontalScroll: allowHorizontalScroll,
        webViewDelegateController: webViewDelegateController,
      );
    }

    if (kWebViewConfig.isInAppWebView) {
      return WebViewInApp(
        url: url,
        data: html,
        shouldPreventNavigator: navigationGuard,
        routeName: routeName,
        title: title,
        script: script.isEmptyOrNull ? kWebViewConfig.webViewScript : script,
        headers: headers,
        enableForward: enableForward,
        enableBackward: enableBackward,
        enableClose: enableClose,
        onClosed: onClosed,
        onUrlChanged: (String? url, String? html, webViewController) {
          onPageFinished?.call(url ?? '');
        },
        appBar: appBar,
        showLoading: showLoading,
        showAppBar: showAppBar,
        hideNewAppBar: hideNewAppBar,
        allowVerticalScroll: allowVerticalScroll,
        allowHorizontalScroll: allowHorizontalScroll,
        webViewDelegateController: webViewDelegateController,
      );
    }

    return WebviewFlutter(
      url: url,
      data: html,
      title: title,
      shouldPreventNavigator: navigationGuard,
      routeName: routeName,
      script: script.isEmptyOrNull ? kWebViewConfig.webViewScript : script,
      headers: headers,
      enableForward: enableForward,
      enableBackward: enableBackward,
      enableClose: enableClose,
      onClosed: onClosed,
      appBar: appBar,
      showLoading: showLoading,
      showAppBar: showAppBar,
      hideNewAppBar: hideNewAppBar,
      onPageFinished: onPageFinished,
      allowVerticalScroll: allowVerticalScroll,
      allowHorizontalScroll: allowHorizontalScroll,
      webViewDelegateController: webViewDelegateController,
    );
  }
}
