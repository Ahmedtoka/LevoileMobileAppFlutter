import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/widgets/background_color_widget.dart';

void main() {
  group('BackgroundColorWidget', () {
    testWidgets('Renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BackgroundColorWidget(child: Icon(Icons.ac_unit)),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      final bgColorWidget = tester.widget<BackgroundColorWidget>(
        find.byType(BackgroundColorWidget),
      );

      final icon = bgColorWidget.child;

      expect(icon, isNotNull);
      expect(icon, isA<Icon>());
    });

    testWidgets('Applies background color when enabled', (
      WidgetTester tester,
    ) async {
      const backgroundColor = Colors.red;
      const showBackground = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BackgroundColorWidget(
              enable: showBackground,
              color: backgroundColor,
              child: Container(),
            ),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      final bgColorWidget = tester.widget<BackgroundColorWidget>(
        find.byType(BackgroundColorWidget),
      );
      final container = bgColorWidget.child;
      final color = bgColorWidget.color;

      expect(container, isA<Container>());
      expect(color, equals(backgroundColor));
    });

    testWidgets('Does not apply background color when disabled', (
      WidgetTester tester,
    ) async {
      const backgroundColor = Colors.red;
      const showBackground = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BackgroundColorWidget(
              enable: showBackground,
              color: backgroundColor,
              child: Container(),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 2));
      final bgColorWidget = tester.widget<BackgroundColorWidget>(
        find.byType(BackgroundColorWidget),
      );
      final container = bgColorWidget.child;

      expect(container, isA<Container>());
      expect((container as Container).decoration, isNull);
    });
  });
}
