import 'package:flutter_test/flutter_test.dart';
import 'package:fstore/models/cart/cart_item_meta_data.dart';
import 'package:fstore/models/cart/cart_model_shopify.dart';
import 'package:fstore/models/entities/product.dart';
import 'package:fstore/models/entities/product_variation.dart';
import 'package:fstore/models/entities/shopify/cart_data_shopify.dart';

/// Le Voile: cover for the per-item discount breakdown in the cart.
///
/// The screen this exists for is the checkout summary the customer stares at
/// before paying: four full-price rows and one "Order discount −E£253.00" at
/// the bottom, with nothing saying which piece lost what. The split has to be
/// right to the cent, because a breakdown that does not add back up to the
/// total the customer is charged is worse than no breakdown at all.
void main() {
  String keyAt(int i) =>
      'gid://shopify/Product/$i-gid://shopify/ProductVariant/$i';

  /// Builds the exact cart from the reported screenshot: four pieces at
  /// 1200 / 250 / 700 / 380 = E£2,530, with a 10% order-level coupon.
  CartModelShopify buildCart({
    required List<double> prices,
    required double orderDiscount,
    String? code,
    List<double>? lineDiscounts,
    List<int>? quantities,
  }) {
    final cart = CartModelShopify();

    final lines = <Map<String, dynamic>>[];
    for (var i = 0; i < prices.length; i++) {
      final productId = 'gid://shopify/Product/$i';
      final variantId = 'gid://shopify/ProductVariant/$i';
      final key = '$productId-$variantId';

      final product = Product()
        ..id = productId
        ..name = 'Item $i'
        ..price = prices[i].toString();
      final variation = ProductVariation()
        ..id = variantId
        ..price = prices[i].toString();

      final quantity = quantities?[i] ?? 1;
      cart.item[productId] = product;
      cart.productsInCart[key] = quantity;
      cart.cartItemMetaDataInCart[key] = CartItemMetaData(variation: variation);

      lines.add({
        'id': 'gid://shopify/CartLine/$i',
        'quantity': quantity,
        'merchandise': {'id': variantId},
        'discountAllocations': [
          if (lineDiscounts != null && lineDiscounts[i] > 0)
            {
              'code': code,
              'discountedAmount': {
                'amount': lineDiscounts[i].toString(),
                'currencyCode': 'EGP',
              },
              'discountApplication': {
                'value': {'__typename': 'PricingPercentageValue',
                  'percentage': 10.0},
              },
            },
        ],
      });
    }

    cart.setCartDataShopify(
      CartDataShopify.fromJson({
        'id': 'gid://shopify/Cart/1',
        'checkoutUrl': 'https://example.com/checkout',
        'note': null,
        'lines': {'nodes': lines},
        'buyerIdentity': {'deliveryAddressPreferences': []},
        'deliveryGroups': {'nodes': []},
        'discountCodes': [
          if (code != null) {'applicable': true, 'code': code},
        ],
        'discountAllocations': [
          if (orderDiscount > 0)
            {
              'code': code,
              'discountedAmount': {
                'amount': orderDiscount.toString(),
                'currencyCode': 'EGP',
              },
              'discountApplication': {
                'value': {'__typename': 'PricingPercentageValue',
                  'percentage': 10.0},
              },
            },
        ],
        'cost': {
          'totalAmount': {'amount': '0', 'currencyCode': 'EGP'},
          'subtotalAmount': {'amount': '0', 'currencyCode': 'EGP'},
        },
      }),
    );

    return cart;
  }

  test('splits an order-level coupon across the pieces it came off', () {
    final cart = buildCart(
      prices: [1200, 250, 700, 380],
      orderDiscount: 253,
      code: 'NEW682226',
    );

    final split = cart.discountPerCartItem;

    expect(split.length, 4);
    // A percentage-off-order discount takes the same 10% from every row.
    expect(split[keyAt(0)]!.amount, closeTo(120, 0.005));
    expect(split[keyAt(1)]!.amount, closeTo(25, 0.005));
    expect(split[keyAt(2)]!.amount, closeTo(70, 0.005));
    expect(split[keyAt(3)]!.amount, closeTo(38, 0.005));

    // And what the customer actually pays for each piece.
    expect(split[keyAt(0)]!.total, closeTo(1080, 0.005));
    expect(split[keyAt(1)]!.total, closeTo(225, 0.005));
    expect(split[keyAt(2)]!.total, closeTo(630, 0.005));
    expect(split[keyAt(3)]!.total, closeTo(342, 0.005));

    expect(split[keyAt(0)]!.label, 'NEW682226');
  });

  test('the parts always add back up to the discount actually charged', () {
    // Prices chosen so the exact shares do NOT land on whole cents — this is
    // where naive rounding leaves the column a cent short or a cent over.
    final cart = buildCart(
      prices: [33.33, 33.33, 33.34],
      orderDiscount: 10,
      code: 'TEN',
    );

    final total = cart.discountPerCartItem.values.fold<double>(
      0,
      (sum, discount) => sum + discount.amount,
    );

    expect((total * 100).round(), 1000);
  });

  test("uses Shopify's own per-line figures for a product discount", () {
    final cart = buildCart(
      prices: [1200, 250],
      orderDiscount: 0,
      code: 'DRESSONLY',
      lineDiscounts: [120, 0],
    );

    final split = cart.discountPerCartItem;

    expect(split.length, 1);
    expect(split[keyAt(0)]!.amount, 120);
    expect(split[keyAt(0)]!.total, 1080);
    expect(split[keyAt(0)]!.label, 'DRESSONLY');
  });

  test('never counts the same discount twice when Shopify reports it in both '
      'places', () {
    // Some API versions echo an order-level allocation onto every line as
    // well. Splitting it again on top would show double the real discount.
    final cart = buildCart(
      prices: [1200, 250],
      orderDiscount: 145,
      code: 'NEW682226',
      lineDiscounts: [120, 25],
    );

    final total = cart.discountPerCartItem.values.fold<double>(
      0,
      (sum, discount) => sum + discount.amount,
    );

    expect((total * 100).round(), 14500);
  });

  test('a row bought more than once is discounted on its whole line', () {
    // 2 dresses at 1,200 = 2,400, one tank at 250 → 2,650, 10% off = 265.
    final cart = buildCart(
      prices: [1200, 250],
      orderDiscount: 265,
      code: 'NEW682226',
      quantities: [2, 1],
    );

    final split = cart.discountPerCartItem;

    expect(split[keyAt(0)]!.subtotal, closeTo(2400, 0.005));
    expect(split[keyAt(0)]!.amount, closeTo(240, 0.005));
    expect(split[keyAt(0)]!.total, closeTo(2160, 0.005));
    expect(split[keyAt(1)]!.amount, closeTo(25, 0.005));
  });

  test('a cart with no discount reports nothing to break down', () {
    final cart = buildCart(prices: [1200, 250], orderDiscount: 0);

    expect(cart.discountPerCartItem, isEmpty);
  });
}
