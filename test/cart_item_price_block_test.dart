import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:fstore/models/entities/product.dart';
import 'package:fstore/widgets/product/cart_item/cart_item_state_ui.dart';
import 'package:fstore/widgets/product/cart_item/widgets/cart_item_price_block.dart';

/// Le Voile: cover for what a discounted cart row actually PRINTS.
///
/// The split arithmetic is covered in cart_discount_split_test.dart; this is
/// the other half — that the customer is shown the old price struck out, the
/// new price, and the amount that came off. A correct number that never makes
/// it onto the screen is the bug being fixed here.
void main() {
  CartItemStateUI buildState({
    String? priceBeforeDiscount,
    String? priceAfterDiscount,
    String? discountAmount,
    String? discountLabel,
  }) {
    return CartItemStateUI(
      enableBottomDivider: false,
      product: Product()
        ..id = 'gid://shopify/Product/1'
        ..name = 'Striped Denim Dress',
      showStoreName: false,
      inStock: true,
      isOnBackorder: false,
      price: '1,200.00LE',
      priceBeforeDiscount: priceBeforeDiscount,
      priceAfterDiscount: priceAfterDiscount,
      discountAmount: discountAmount,
      discountLabel: discountLabel,
      quantity: 1,
      onTapProduct: (_, {required Product product}) {},
    );
  }

  Future<void> pump(WidgetTester tester, CartItemStateUI stateUI) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        home: Scaffold(body: CartItemPriceBlock(stateUI)),
      ),
    );
    // The localization delegate resolves asynchronously; without settling,
    // MaterialApp is still showing an empty frame.
    await tester.pumpAndSettle();
  }

  testWidgets('a discounted row shows old price, new price and the saving', (
    tester,
  ) async {
    await pump(
      tester,
      buildState(
        priceBeforeDiscount: '1,200.00LE',
        priceAfterDiscount: '1,080.00LE',
        discountAmount: '120.00LE',
        discountLabel: 'NEW682226',
      ),
    );

    final oldPrice = tester.widget<Text>(find.text('1,200.00LE'));
    expect(
      oldPrice.style?.decoration,
      TextDecoration.lineThrough,
      reason: 'the pre-discount price must read as superseded, not as the '
          'price being charged',
    );

    expect(find.text('1,080.00LE'), findsOneWidget);
    expect(find.text('- 120.00LE'), findsOneWidget);
    expect(find.textContaining('NEW682226'), findsOneWidget);
  });

  testWidgets('an undiscounted row prints the single plain price it always '
      'did', (tester) async {
    await pump(tester, buildState());

    final price = tester.widget<Text>(find.text('1,200.00LE'));
    expect(price.style?.decoration, isNot(TextDecoration.lineThrough));
    expect(find.textContaining('- '), findsNothing);
    expect(find.byIcon(Icons.local_offer_outlined), findsNothing);
  });

  testWidgets('a discount Shopify does not name still shows its amount', (
    tester,
  ) async {
    await pump(
      tester,
      buildState(
        priceBeforeDiscount: '1,200.00LE',
        priceAfterDiscount: '1,080.00LE',
        discountAmount: '120.00LE',
      ),
    );

    expect(find.text('1,080.00LE'), findsOneWidget);
    expect(find.text('- 120.00LE'), findsOneWidget);
  });
}
