import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/config.dart';
import '../../../common/extensions/string_ext.dart';

mixin WebviewMixin {
  /// Le Voile: does this URL lead to the STOREFRONT's own basket?
  ///
  /// A page opened in an in-app webview is a real browser session on the shop
  /// domain, and Shopify keeps a cart there in a cookie. That cart has NOTHING
  /// to do with the one the app builds through the Storefront API — different
  /// contents, different total, and a "Check out" button that walks straight
  /// past the app's coupon and quantity rules. A customer who reaches it sees
  /// two shops disagreeing about what they are buying.
  ///
  /// Matched on PATH, not on the whole URL, so it holds for whichever domain
  /// the shop is served from and for any query string Shopify appends.
  ///
  /// ⚠ `/checkouts/` is on this list, so this must never be applied to the
  /// checkout webview itself — that screen's whole job is to load exactly
  /// these URLs. It is opt-in per webview ([WebView.redirectStoreCartToApp])
  /// for that reason, and is NOT part of [shouldPreventWebNavigation].
  static bool isStoreCartUrl(String url) {
    final path = Uri.tryParse(url)?.path.toLowerCase();
    if (path == null || path.isEmpty) {
      return false;
    }
    const cartPaths = ['/cart', '/checkout', '/checkouts'];
    return cartPaths.any(
      (cartPath) => path == cartPath || path.startsWith('$cartPath/'),
    );
  }

  /// Return true when overridden and the navigation in webview should stop.
  ///
  /// `externalDomains` is list of domains that should open the external app
  /// instead of the webview.
  ///
  /// `internalDomains` is list of domains that should be loaded in the webview.
  /// If the list is empty, all domains will be opened in the webview if it is
  /// not in [externalDomains]. Otherwise, if the domain is not in this list, it
  /// will be opened in the external browser.
  Future<bool> shouldPreventWebNavigation(String url) async {
    if (url.startsWith('http')) {
      final internalDomains = kWebViewConfig.internalDomains;
      final externalDomains = kWebViewConfig.externalDomains;

      // If not configured, open all http sites in webview
      if (internalDomains.isEmpty && externalDomains.isEmpty) {
        return false;
      }

      // If `url` is in `internalDomains`, always open in webview
      if (internalDomains.isNotEmpty &&
          internalDomains.any(url.isTheSameDomain)) {
        return false;
      }

      // If `url` is on `externalDomains`, always open in external app/browser
      if (externalDomains.isNotEmpty &&
          externalDomains.any(url.isTheSameDomain)) {
        return _openExternalUrl(url);
      }

      // If `internalDomains` is configured, but `url` is not included then it
      // will open in external app/browser
      if (internalDomains.isNotEmpty &&
          !internalDomains.any(url.isTheSameDomain)) {
        return _openExternalUrl(url);
      }

      // Open in webview
      return false;
    }

    // If not http urls, open in external app/browser
    return _openExternalUrl(url);
  }

  Future<bool> _openExternalUrl(String url) async {
    // Try to open other sites in external browser/app, not `platformDefault` or
    // `inAppBrowserView` because it does not work properly on iOS. When user
    // opens an external link and then closes it before the page is loaded, it
    // tries to open this link in webview again, which is not expected.
    try {
      final newUrl = Tools.prepareURL(url);
      return await Tools.launchURL(
        newUrl,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } catch (err, stack) {
      printError(err, stack);
      return false;
    }
  }
}
