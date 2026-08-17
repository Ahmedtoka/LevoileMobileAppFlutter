import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fstore/screens/custom/coupon_welcome_dialog.dart';
import 'package:fstore/services/coupon_service.dart';

/// Regression cover for App Store rejection 2.1(a) — "unable to bypass discount
/// coupon code redemption" (submission 931f49d4, 1.6.2 build 9).
///
/// The phone prompt used to be exit-proof: barrierDismissible was false, there
/// was no close/skip control, and its only exit required a valid 11-digit
/// Egyptian mobile number. A reviewer (or any customer without an Egyptian
/// number) was stuck on the home screen. Claiming a coupon is optional and
/// closing this dialog must ALWAYS be possible.
void main() {
  /// Opens the dialog exactly the way WelcomeCouponFlow does and reports what
  /// it popped with.
  Future<void> pumpDialog(
    WidgetTester tester, {
    required void Function(String?) onClosed,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              final result = await showDialog<String>(
                context: context,
                barrierDismissible: true,
                builder: (_) => const CouponPhoneDialog(),
              );
              onClosed(result);
            },
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.byType(CouponPhoneDialog), findsOneWidget);
  }

  testWidgets('closes via the X without entering a phone number', (
    tester,
  ) async {
    String? result;
    var closed = false;
    await pumpDialog(tester, onClosed: (r) {
      result = r;
      closed = true;
    });

    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(CouponPhoneDialog), findsNothing);
    expect(closed, isTrue);
    expect(result, isNull, reason: 'dismissing must not claim a coupon');
  });

  testWidgets('closes via "Not now" without entering a phone number', (
    tester,
  ) async {
    String? result;
    var closed = false;
    await pumpDialog(tester, onClosed: (r) {
      result = r;
      closed = true;
    });

    await tester.tap(find.text('Not now'));
    await tester.pumpAndSettle();

    expect(find.byType(CouponPhoneDialog), findsNothing);
    expect(closed, isTrue);
    expect(result, isNull);
  });

  // Note: the harness above mirrors WelcomeCouponFlow's showDialog call, so
  // this pins the intended contract (barrierDismissible: true) rather than
  // reading the flow's own call site — keep the two in sync.
  testWidgets('closes by tapping outside the dialog', (tester) async {
    var closed = false;
    await pumpDialog(tester, onClosed: (_) => closed = true);

    // Top-left corner is the barrier, well clear of the dialog card.
    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();

    expect(find.byType(CouponPhoneDialog), findsNothing);
    expect(closed, isTrue);
  });

  testWidgets('the close control stays reachable on an iPad-sized screen', (
    tester,
  ) async {
    // iPad Air 11-inch (M3) — the review device — in logical points.
    tester.view.physicalSize = const Size(1640, 2360);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.reset);

    var closed = false;
    await pumpDialog(tester, onClosed: (_) => closed = true);

    // Clip.none on the header Stack keeps the negatively-offset X hit-testable.
    await tester.tap(find.byIcon(Icons.close_rounded), warnIfMissed: true);
    await tester.pumpAndSettle();

    expect(closed, isTrue);
  });

  testWidgets('a valid Egyptian number still claims normally', (tester) async {
    String? result;
    await pumpDialog(tester, onClosed: (r) => result = r);

    await tester.enterText(find.byType(TextField), '01008820066');
    await tester.tap(find.text('Get my coupon'));
    await tester.pumpAndSettle();

    expect(find.byType(CouponPhoneDialog), findsNothing);
    expect(result, CouponService.normalizePhone('01008820066'));
  });

  testWidgets('an invalid number shows an error and keeps the dialog open', (
    tester,
  ) async {
    await pumpDialog(tester, onClosed: (_) {});

    await tester.enterText(find.byType(TextField), '12345');
    await tester.tap(find.text('Get my coupon'));
    await tester.pumpAndSettle();

    expect(find.byType(CouponPhoneDialog), findsOneWidget);
    expect(find.textContaining('11 digits'), findsOneWidget);
    // …and it is still escapable while showing the error.
    expect(find.text('Not now'), findsOneWidget);
  });
}
