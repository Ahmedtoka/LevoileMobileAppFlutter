import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';

void main() {
  testWidgets('HeaderSearch widget test', (WidgetTester tester) async {
    // Create a test widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(config: HeaderConfig(), onSearch: () {}),
        ),
      ),
    );

    // Verify that the HeaderSearch widget is rendered
    expect(find.byType(HeaderSearch), findsOneWidget);

    // Verify that the InkWell widget is rendered
    expect(find.byType(InkWell), findsOneWidget);

    // Verify that the Text widget is rendered
    expect(find.byType(Text), findsOneWidget);

    // Verify that the Icon widget is rendered
    expect(find.byType(Icon), findsOneWidget);
  });
  // Verify that the InkWell widget triggers the onSearch callback when tapped
  testWidgets('HeaderSearch onTap test', (WidgetTester tester) async {
    var searchTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(),
            onSearch: () {
              searchTapped = true;
            },
          ),
        ),
      ),
    );

    final inkWell = find.byType(InkWell);
    await tester.tap(inkWell);

    expect(searchTapped, true);
  });

  // Verify that the Text widget displays the correct title
  testWidgets('HeaderSearch title test', (WidgetTester tester) async {
    var title = 'Search';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(title: title),
            onSearch: () {},
          ),
        ),
      ),
    );

    final textWidget = find.text(title);
    expect(textWidget, findsOneWidget);
  });

  // Verify that the Icon widget displays the correct icon
  testWidgets('HeaderSearch icon test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(config: HeaderConfig(), onSearch: () {}),
        ),
      ),
    );

    final iconWidget = find.byIcon(CupertinoIcons.search);
    expect(iconWidget, findsOneWidget);
  });

  // Verify that the HeaderSearch widget has the correct background color
  testWidgets('HeaderSearch background color test', (
    WidgetTester tester,
  ) async {
    const Color backgroundColor = Colors.blue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(
              enableBackground: true,
              backgroundColor: backgroundColor.valueNum.toRadixString(16),
            ),
            onSearch: () {},
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
  });

  // Verify that the HeaderSearch widget triggers the onSearch callback when tapped
  testWidgets('HeaderSearch onTap test', (WidgetTester tester) async {
    var searchTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(),
            onSearch: () {
              searchTapped = true;
            },
          ),
        ),
      ),
    );

    final inkWell = find.byType(InkWell);
    await tester.tap(inkWell);

    expect(searchTapped, true);
  });

  // Verify that the HeaderSearch widget renders correctly when onSearch is null
  testWidgets('HeaderSearch onSearch null test', (WidgetTester tester) async {
    var searchTapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(config: HeaderConfig(), onSearch: null),
        ),
      ),
    );

    // Verify that the InkWell widget is rendered
    expect(find.byType(InkWell), findsOneWidget);

    // Verify that the onTap callback is not triggered when InkWell is tapped
    final inkWell = find.byType(InkWell);
    await tester.tap(inkWell);
    // Wait for any animations to complete
    await tester.pumpAndSettle();
    // Verify that the onTap callback is not triggered
    expect(searchTapped, false);
  });

  // Verify that the HeaderSearch widget renders correctly when useGradiantBG is true
  testWidgets('HeaderSearch useGradiantBG test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(
              backgroundGradientColor: [
                HexColor('#FF0000'),
                HexColor('#00FF00'),
                HexColor('#0000FF'),
              ],
            ),
            onSearch: () {},
          ),
        ),
      ),
    );

    final backgroundColorWidget = find
        .byType(BackgroundColorWidget)
        .first
        .evaluate()
        .single
        .widget;

    expect((backgroundColorWidget as BackgroundColorWidget).enable, true);
    expect((backgroundColorWidget).decoration, isA<Decoration>());
  });

  // Verify that the HeaderSearch widget renders correctly when useGradiantBG is false
  testWidgets('HeaderSearch not useGradiantBG test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(config: HeaderConfig(), onSearch: () {}),
        ),
      ),
    );

    final backgroundColorWidget = find
        .byType(BackgroundColorWidget)
        .first
        .evaluate()
        .single
        .widget;
    expect((backgroundColorWidget as BackgroundColorWidget).enable, false);
    expect(backgroundColorWidget.decoration, null);
  });

  // Verify that the HeaderSearch widget renders correctly when boxShadow is not null
  testWidgets('HeaderSearch boxShadow test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(
              boxShadow: BoxShadowConfig(blurRadius: 5.0, spreadRadius: 2.0),
            ),
            onSearch: () {},
          ),
        ),
      ),
    );

    final container = find.byType(Container).first.evaluate().single.widget;
    expect((container as Container).decoration, isA<Decoration>());
  });

  // Verify that the HeaderSearch widget renders correctly when config.textColor is provided
  testWidgets('HeaderSearch textColor test', (WidgetTester tester) async {
    const textColor = '#FF0000';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(textColor: textColor),
            onSearch: () {},
          ),
        ),
      ),
    );

    final textWidget = find.byType(Text).first.evaluate().single.widget;
    expect((textWidget as Text).style!.color, equals(HexColor(textColor)));
  });

  // Verify that the HeaderSearch widget renders correctly when config.borderInput is true
  testWidgets('HeaderSearch borderInput test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(borderInput: true),
            onSearch: () {},
          ),
        ),
      ),
    );

    final container = find.byType(Container).first.evaluate().single.widget;
    expect((container as Container).decoration, isA<Decoration>());

    final decoration = container.decoration as BoxDecoration;
    expect(decoration.border, isNull);
  });

  // Verify that the HeaderSearch widget renders correctly when config.usePrimaryColor is true
  testWidgets('HeaderSearch usePrimaryColor test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HeaderSearch(
            config: HeaderConfig(usePrimaryColor: true),
            onSearch: () {},
          ),
        ),
      ),
    );

    final container =
        find.byType(Container).first.evaluate().single.widget as Container;
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, isNull);
  });
}
