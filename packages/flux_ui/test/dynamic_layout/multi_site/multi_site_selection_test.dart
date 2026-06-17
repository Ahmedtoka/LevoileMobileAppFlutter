import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../core/mocks/mock_constants.dart';

void main() {
  group('MultiSiteSelection', () {
    final multiSiteConfigs = [
      const MultiSiteConfig(
        name: 'Example Site 1',
        icon: MockConstants.remotePNG,
      ),
      const MultiSiteConfig(
        name: 'Example Site 2',
        icon: MockConstants.remotePNG,
      ),
      const MultiSiteConfig(
        name: 'Example Site 3',
        icon: MockConstants.remotePNG,
      ),
    ];

    testWidgets('renders correct number of MultiSiteItem widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiSiteSelection(
              multiSiteConfigs: multiSiteConfigs,
              onChanged: (config) {},
            ),
          ),
        ),
      );

      expect(
        find.byType(MultiSiteItem),
        findsNWidgets(multiSiteConfigs.length),
      );
    });

    testWidgets('calls onChanged callback when MultiSiteItem is tapped', (
      WidgetTester tester,
    ) async {
      MultiSiteConfig? selectedConfig;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiSiteSelection(
              multiSiteConfigs: multiSiteConfigs,
              enabled: true,
              onChanged: (config) {
                selectedConfig = config;
              },
            ),
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 2));

      final multiSiteItems = find.byType(MultiSiteItem);
      expect(multiSiteItems, findsNWidgets(multiSiteConfigs.length));

      // Tap the first MultiSiteItem
      await tester.tap(multiSiteItems.first);
      await tester.pump();
      await tester.pump(const Duration(seconds: 2));

      expect(selectedConfig, equals(multiSiteConfigs.first));
    });
  });
}
