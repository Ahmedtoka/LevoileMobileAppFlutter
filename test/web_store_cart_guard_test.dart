import 'package:flutter_test/flutter_test.dart';
import 'package:fstore/widgets/common/webview/webview_mixin.dart';

/// Le Voile: cover for the in-app webview never handing the customer the
/// SHOP WEBSITE's basket.
///
/// A page opened in a webview is a real browser session on the shop domain,
/// and Shopify keeps a separate cart there in a cookie. A customer who
/// reached it saw a basket whose total disagreed with the app's, and a Check
/// Out button that walked past the app's coupon and quantity rules entirely.
///
/// The second group is the one that actually matters: `/checkouts/...` is
/// what the app's OWN checkout webview loads. These pin that the matcher
/// still recognises it — which is exactly why the guard must stay opt-in per
/// webview and must never be wired into the checkout screen.
void main() {
  const shop = 'https://levoilestores.myshopify.com';

  group('recognises the web shop basket', () {
    for (final url in [
      '$shop/cart',
      '$shop/cart/',
      '$shop/cart?view=drawer',
      '$shop/cart/12345:1',
      '$shop/checkout',
      '$shop/checkouts/c/abc123',
      'https://levoile.com/cart',
    ]) {
      test(url, () => expect(WebviewMixin.isStoreCartUrl(url), isTrue));
    }
  });

  group('leaves ordinary pages alone', () {
    for (final url in [
      shop,
      '$shop/',
      '$shop/collections/new-in',
      '$shop/products/striped-denim-dress',
      '$shop/pages/shipping',
      // Must NOT be mistaken for the basket: a real product whose handle
      // merely starts with the same letters.
      '$shop/products/cartigan-beige',
      '$shop/collections/cart-accessories',
      'https://www.instagram.com/levoile',
      '',
      'not a url at all',
    ]) {
      test(url.isEmpty ? '(empty)' : url, () {
        expect(WebviewMixin.isStoreCartUrl(url), isFalse);
      });
    }
  });
}
