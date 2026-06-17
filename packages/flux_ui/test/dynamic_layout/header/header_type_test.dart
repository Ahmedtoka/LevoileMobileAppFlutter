import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/dynamic_layout/header/header_type.dart';
import 'package:flux_ui/src/entities/header_config.dart';
import 'package:flux_ui/src/widgets/html_widget.dart';

void main() {
  group('HeaderType', () {
    testWidgets('renders HtmlWidget when animatedTexts is empty', (
      WidgetTester tester,
    ) async {
      final config = HeaderConfig(
        type: 'static',
        title: 'Test Title',
        font: 'Roboto',
        fontSize: 16,
        textOpacity: 1.0,
        fontWeight: 500,
        textColor: '#000000',
        alignment: 'center',
        rotate: [],
        minWidth: 0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderType(
              config: config,
              getReplacedParams: (String? param) {
                return param ?? '';
              },
            ),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 6));

      // expect(find.text('Test Title'), findsOneWidget);
      expect(find.byType(HtmlWidget), findsOneWidget);
    });

    testWidgets('renders AnimatedTextKit when animatedTexts is not empty', (
      WidgetTester tester,
    ) async {
      final config = HeaderConfig(
        type: 'rotate',
        title: 'Test Title',
        font: 'Arial',
        fontSize: 16,
        textOpacity: 1.0,
        fontWeight: 500,
        textColor: '#000000',
        alignment: 'center',
        rotate: ['Text 1', 'Text 2'],
        minWidth: 0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderType(
              config: config,
              getReplacedParams: (String? param) => param ?? '',
            ),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Test Title'), findsNothing);
      expect(find.byType(AnimatedTextKit), findsOneWidget);
    });
  });
}
