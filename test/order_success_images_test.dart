import 'package:flutter_test/flutter_test.dart';
import 'package:fstore/env.dart';
import 'package:fstore/models/entities/product.dart';
import 'package:fstore/models/order/product_item.dart';
import 'package:fstore/services/service_config.dart';

/// Le Voile: cover for the Thank You screen actually having pictures on it.
///
/// After confirming an order the invoice showed a column of blank squares.
/// Two separate causes, one per checkout path, and each is pinned below.
void main() {
  // cleanProductID branches on the backend type, which main.dart sets from
  // env.dart at launch.
  setUpAll(() => ServerConfig().setConfig(environment['serverConfig']));

  group('an order read back from Shopify', () {
    Map lineItem({String? variantImage, String? productImage}) => {
      'id': 'gid://shopify/LineItem/1',
      'title': 'Striped Denim Dress',
      'quantity': 1,
      'originalTotalPrice': {'amount': '1200.00'},
      'variant': {
        'id': 'gid://shopify/ProductVariant/1',
        if (variantImage != null) 'image': {'url': variantImage},
        'product': {
          'id': 'gid://shopify/Product/1',
          if (productImage != null) 'featuredImage': {'url': productImage},
        },
      },
    };

    test('uses the variant photo when the colour has one of its own', () {
      final item = ProductItem.fromShopifyJson(
        lineItem(variantImage: 'variant.jpg', productImage: 'product.jpg'),
      );

      expect(item.featuredImage, 'variant.jpg');
    });

    test('falls back to the product photo when the variant has none', () {
      // This is the case that produced blank squares: Le Voile attaches
      // photos to the product and lets the colours share them, so Shopify
      // returns no variant image at all.
      final item = ProductItem.fromShopifyJson(
        lineItem(productImage: 'product.jpg'),
      );

      expect(item.featuredImage, 'product.jpg');
    });

    test('survives a line item with no picture anywhere', () {
      final item = ProductItem.fromShopifyJson(lineItem());

      expect(item.featuredImage, isNull);
      expect(item.name, 'Striped Denim Dress');
    });
  });

  group('the cart snapshot kept for a guest checkout', () {
    test('a cart key is not a product id', () {
      // The whole first bug in one line: the snapshot looked products up with
      // `productId-variantId` against a map keyed by `productId` alone, so
      // every lookup missed and every row came out nameless and imageless.
      const cartKey =
          'gid://shopify/Product/1-gid://shopify/ProductVariant/2';

      expect(
        Product.cleanProductID(cartKey),
        'gid://shopify/Product/1',
        reason: 'the snapshot must strip the variant before looking a '
            'product up, the way the cart list does',
      );
    });

    test('carries the picture through to the invoice row', () {
      final item = ProductItem.fromLocalJson({
        'product_id': 'gid://shopify/Product/1',
        'name': 'Striped Denim Dress',
        'quantity': 1,
        'total': 1200.0,
        'featuredImage': 'product.jpg',
      });

      expect(item.featuredImage, 'product.jpg');
      expect(item.name, 'Striped Denim Dress');
    });
  });
}
