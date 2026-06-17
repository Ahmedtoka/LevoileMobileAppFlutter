import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/widgets/html_widget.dart';

void main() {
  group('HtmlWidget', () {
    testWidgets('renders HTML correctly', (WidgetTester tester) async {
      const html = '<h1>Hello, World!</h1>';
      const widget = HtmlWidget(html);

      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: widget)));
      await tester.pump(const Duration(seconds: 2));

      expect(find.byType(HtmlWidget), findsOneWidget);
    });

    // testWidgets('applies custom text style', (WidgetTester tester) async {
    //   const html = '<p>Custom Text Style</p>';
    //   const textStyle = TextStyle(fontSize: 20);
    //   const widget = HtmlWidget(html, textStyle: textStyle);

    //   await tester.pumpWidget(const MaterialApp(home: Scaffold(body: widget)));
    //   await tester.pump(const Duration(seconds: 2));

    //   final textWidget = tester.widget<Text>(find.byType(Text));
    //   expect(textWidget.style?.fontSize, 20);
    // });

    // testWidgets('limits text to max lines', (WidgetTester tester) async {
    //   const html = '<p>Long Text</p>';
    //   const maxLines = 2;
    //   const widget = HtmlWidget(html, maxLines: maxLines);

    //   await tester.pumpWidget(const MaterialApp(home: Scaffold(body: widget)));
    //   await tester.pump(const Duration(seconds: 2));

    //   final textWidget = tester.widget<Text>(find.byType(Text));
    //   expect(textWidget.maxLines, maxLines);
    // });

    // testWidgets('handles tap on URL', (WidgetTester tester) async {
    //   const html = '<a href="https://example.com">Click me</a>';

    //   bool handledTap = false;
    //   FutureOr<bool> handleTapUrl(String url) {
    //     handledTap = true;
    //     return true;
    //   }

    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: HtmlWidget(
    //           html,
    //           onTapUrl: handleTapUrl,
    //         ),
    //       ),
    //     ),
    //   );
    //   await tester.pump(const Duration(seconds: 2));

    //   final linkFinder = find.byType(GestureDetector);
    //   expect(linkFinder, findsOneWidget);

    //   await tester.tap(linkFinder);
    //   await tester.pumpAndSettle();

    //   expect(handledTap, true);
    // });
  });
}
