import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

void main() {
  group('HeaderText', () {
    final config = HeaderConfig(
      height: 100,
      enableBackground: true,
      backgroundColor: '#FFFFFF',
      paddingTop: 10,
      paddingLeft: 20,
      paddingRight: 20,
      paddingBottom: 10,
      marginTop: 0,
      marginLeft: 0,
      marginRight: 0,
      marginBottom: 0,
      showSearch: true,
      alignment: 'center',
      isSafeArea: true,
    );

    testWidgets('renders HeaderText widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderText(
              config: config,
              onSearch: () {},
              getReplacedParams: (String? param) => '',
            ),
          ),
        ),
      );

      expect(find.byType(HeaderText), findsOneWidget);
    });

    testWidgets('renders BackgroundColorWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderText(
              config: config,
              onSearch: () {},
              getReplacedParams: (String? param) => '',
            ),
          ),
        ),
      );

      expect(find.byType(BackgroundColorWidget), findsOneWidget);
    });

    testWidgets('renders HeaderType widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderText(
              config: config,
              onSearch: () {},
              getReplacedParams: (String? param) => '',
            ),
          ),
        ),
      );

      expect(find.byType(HeaderType), findsOneWidget);
    });

    testWidgets('renders IconButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HeaderText(
              config: config,
              onSearch: () {},
              getReplacedParams: (String? param) => '',
            ),
          ),
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}
