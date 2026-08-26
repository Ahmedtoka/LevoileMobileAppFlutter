import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:fstore/data/boxes.dart';
import 'package:fstore/models/cart/cart_base.dart';
import 'package:fstore/models/cart/cart_model_shopify.dart';
import 'package:fstore/screens/cart/widgets/order_summary_lines.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:inspireui/widgets/coupon_card.dart';
import 'package:provider/provider.dart';

/// Le Voile: cover for the cart breakdown being VISIBLE without a tap.
///
/// It used to be locked inside a modal sheet opened by a small arrow beside
/// the total, so a customer who had just applied a coupon saw a total 253
/// lower than their pieces added up to and nothing on screen saying why.
/// These pin the two halves of the fix: it shows itself when there is
/// something to explain, and it stays out of the way when there is not.
void main() {
  // PriceTools reads the chosen language out of the settings box to format
  // money; give it a throwaway one so the widget can render at all.
  setUpAll(() async {
    final dir = await Directory.systemTemp.createTemp('levoile_test');
    Hive.init(dir.path);
    await SettingsBox().init();
  });

  CartModelShopify buildCart({Coupon? coupon}) {
    final cart = CartModelShopify();
    if (coupon != null) {
      cart.couponObj = coupon;
    }
    return cart;
  }

  Future<void> pump(WidgetTester tester, CartModel cart) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<CartModel>.value(
        value: cart,
        child: MaterialApp(
          localizationsDelegates: const [S.delegate],
          supportedLocales: S.delegate.supportedLocales,
          home: const Scaffold(
            body: OrderSummaryLines(currencyRate: {}, currency: 'EGP'),
          ),
        ),
      ),
    );
    // The localization delegate resolves asynchronously; without settling,
    // MaterialApp is still showing an empty frame.
    await tester.pumpAndSettle();
  }

  testWidgets('a coupon explains itself with no tap needed', (tester) async {
    await pump(
      tester,
      buildCart(
        coupon: Coupon(code: 'new682226', amount: 253, discountType: 'fixed'),
      ),
    );

    expect(find.textContaining('new682226'), findsOneWidget);
    expect(find.textContaining('253'), findsOneWidget);
  });

  testWidgets('a plain cart adds no strip of screen for nothing', (
    tester,
  ) async {
    await pump(tester, buildCart());

    // Subtotal alone, sitting above an identical total, explains nothing.
    expect(find.byType(Row), findsNothing);
  });

  test('hasAnyLine agrees with what the widget will draw', () {
    expect(OrderSummaryLines.hasAnyLine(buildCart()), isFalse);
    expect(
      OrderSummaryLines.hasAnyLine(
        buildCart(
          coupon: Coupon(code: 'new682226', amount: 253, discountType: 'fixed'),
        ),
      ),
      isTrue,
    );
  });
}
