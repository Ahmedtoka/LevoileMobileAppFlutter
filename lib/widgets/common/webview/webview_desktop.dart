import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart' hide kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import 'webview_interface.dart';

class WebViewDesktop extends WebviewInterface {
  const WebViewDesktop({
    super.key,
    super.title,
    super.url,
    super.data,
    super.appBar,
    super.onPageFinished,
    super.shouldPreventNavigator,
    super.onClosed,
    super.script,
    super.headers,
    super.enableForward,
    super.enableBackward,
    super.enableClose,
    super.routeName,
    super.hideNewAppBar,
    super.showAppBar,
    super.showLoading,
    super.allowVerticalScroll,
    super.allowHorizontalScroll,
    super.webViewDelegateController,
  });

  @override
  State<WebViewDesktop> createState() => WebViewDesktopState();
}

class WebViewDesktopState extends StateWebviewInterface<WebViewDesktop> {
  final GlobalKey webViewKey = GlobalKey();

  int selectedIndex = 1;

  InAppWebViewController? webViewController;

  final InAppWebViewSettings settings = InAppWebViewSettings(
    useShouldOverrideUrlLoading: true,
    transparentBackground: true,
    mediaPlaybackRequiresUserGesture: false,
    useOnDownloadStart: true,
    useHybridComposition: true,
    allowsInlineMediaPlayback: true,
    geolocationEnabled: true,
    useWideViewPort: true,
  );

  URLRequest? get initialUrlRequest {
    final webUrl = url;
    if (webUrl != null) {
      return URLRequest(url: WebUri(webUrl), headers: widget.headers);
    }
    return null;
  }

  InAppWebViewInitialData? get initialData {
    final html = widget.data;
    if (html != null && html.isNotEmpty) {
      return InAppWebViewInitialData(data: html);
    }
    return null;
  }

  @override
  Future<bool> onTapBackButton(BuildContext buildContext) async {
    final canGoBack = await webViewController?.canGoBack();
    if (canGoBack == true) {
      await webViewController?.goBack();
      return true;
    }

    if (canPop) {
      widget.onClosed?.call();
      Navigator.of(context).pop();
      return true;
    }

    return false;
  }

  @override
  Future<bool> onTapForwardButton(BuildContext buildContext) async {
    final canGoForward = await webViewController?.canGoForward();
    if (canGoForward == true) {
      await webViewController?.goForward();

      return true;
    }

    return false;
  }

  @override
  void onTapCloseButton() async {
    widget.onClosed?.call();

    if (canPop) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    if (kWebViewConfig.alwaysClearWebViewCache) {
      InAppWebViewController.clearAllCache();
    }
    super.dispose();
  }

  void _onRedirectUrl(String url, InAppWebViewController controller) {
    widget.onRedirectUrl?.call(
      url,
      (url) async {
        await controller.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
      },
      () async {
        final html = await controller.getHtml();
        return html;
      },
    );
  }

  @override
  Widget renderWebview() {
    return IndexedStack(
      index: selectedIndex,
      children: [
        InAppWebView(
          key: webViewKey,
          initialUrlRequest: initialUrlRequest,
          initialData: initialData,
          initialUserScripts: UnmodifiableListView<UserScript>([
            /// Demo the Javascript Style override
            UserScript(
              source: widget.script,
              injectionTime: UserScriptInjectionTime.AT_DOCUMENT_END,
            ),
          ]),
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final url = navigationAction.request.url?.toString();

            if (url != null) {
              // Only check main frame navigation.
              // Do not handle subframe navigation
              if (!navigationAction.isForMainFrame) {
                return NavigationActionPolicy.ALLOW;
              }

              // handle redirect url
              _onRedirectUrl(url, controller);

              final prevent =
                  await widget.shouldPreventNavigator?.call(url) ?? false;
              if (prevent) {
                printLog('[WebViewDesktop] should prevent navigator: $url');
                return NavigationActionPolicy.CANCEL;
              }
            }
            return NavigationActionPolicy.ALLOW;
          },
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
            if (widget.allowVerticalScroll)
              const Factory<VerticalDragGestureRecognizer>(
                VerticalDragGestureRecognizer.new,
              ),
            if (widget.allowHorizontalScroll)
              const Factory<HorizontalDragGestureRecognizer>(
                HorizontalDragGestureRecognizer.new,
              ),
          },
          initialSettings: settings,
          onWebViewCreated: (controller) {
            webViewController = controller;
            InAppWebViewController.clearAllCache();
          },
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
              resources: request.resources,
              action: PermissionResponseAction.GRANT,
            );
          },
          onGeolocationPermissionsShowPrompt:
              (InAppWebViewController controller, String origin) async {
                var status = await Permission.locationWhenInUse.status;

                if (status.isDenied) {
                  // For the first time if user have never asked for permission yet,
                  // this status will return [PermissionStatus.denied].
                  status = await Permission.locationWhenInUse.request();
                } else if (status.isPermanentlyDenied) {
                  // For the next time if user already denied permission, they
                  // must go to app settings to allow permission manually again.
                  await openAppSettings();
                }

                return GeolocationPermissionShowPromptResponse(
                  origin: origin,
                  allow: status.isGranted,
                  retain: true,
                );
              },
          onLoadStop: (_, __) {
            setState(() {
              selectedIndex = 0;
            });
          },
          onDownloadStartRequest: (_, request) async {
            await launchUrl(request.url);
          },
        ),
        if (widget.showLoading)
          Center(child: kLoadingWidget(context))
        else
          const SizedBox(),
      ],
    );
  }
}
