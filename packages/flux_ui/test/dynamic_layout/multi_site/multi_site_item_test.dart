import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/dynamic_layout/multi_site/multi_site_item.dart';
import 'package:flux_ui/src/entities/multi_site.dart';
import 'package:flux_ui/src/widgets/flux_image.dart';

import '../../core/mocks/mock_constants.dart';

void main() {
  testWidgets('MultiSiteItem should render correctly', (
    WidgetTester tester,
  ) async {
    // Create a MultiSiteConfig instance for testing
    const multiSiteConfig = MultiSiteConfig(
      name: 'Example Site',
      icon: MockConstants.localPNG,
    );

    // Build the MultiSiteItem widget
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MultiSiteItem(
            multiSiteConfig: multiSiteConfig,
            selected: false,
            onTap: (config) {},
          ),
        ),
      ),
    );

    // Verify that the widget renders correctly
    expect(find.text('Example Site'), findsOneWidget);
    expect(find.byType(FluxImage), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsNothing);
    expect(find.byIcon(Icons.circle_outlined), findsOneWidget);
  });

  testWidgets('MultiSiteItem should call onTap when tapped', (
    WidgetTester tester,
  ) async {
    // Create a MultiSiteConfig instance for testing
    const multiSiteConfig = MultiSiteConfig(
      name: 'Example Site',
      icon: MockConstants.remotePNG,
    );

    // Define a variable to store the tapped config
    MultiSiteConfig? tappedConfig;

    // Build the MultiSiteItem widget
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MultiSiteItem(
            multiSiteConfig: multiSiteConfig,
            selected: false,
            onTap: (config) {
              tappedConfig = config;
            },
          ),
        ),
      ),
    );

    // Tap the widget
    await tester.tap(find.byType(GestureDetector));

    // Verify that onTap was called with the correct config
    expect(tappedConfig, multiSiteConfig);
  });
}
