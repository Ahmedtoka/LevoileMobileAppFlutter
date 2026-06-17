import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../core/mocks/mock_constants.dart';

void main() {
  group('LogoIcon', () {
    testWidgets('renders without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LogoIcon(config: LogoConfig(), onTap: () {}),
          ),
        ),
      );

      expect(find.byType(LogoIcon), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LogoIcon(
              config: LogoConfig(),
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(LogoIcon));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });

  group('LogoWidget', () {
    testWidgets('renders without error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: LogoWidget(
              config: LogoConfig(),
              onSearch: () {},
              onCheckout: () {},
              onTapDrawerMenu: () {},
              onTapNotifications: () {},
            ),
          ),
        ),
      );

      expect(find.byType(LogoWidget), findsOneWidget);
    });

    testWidgets('calls onSearch when search icon is tapped', (
      WidgetTester tester,
    ) async {
      var searched = false;
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(showSearch: true),
            onSearch: () {
              searched = true;
            },
            onCheckout: () {},
            onTapDrawerMenu: () {},
            onTapNotifications: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.byType(LogoIcon).at(0));
      await tester.pump();

      expect(searched, true);
    });

    testWidgets('calls onCheckout when cart icon is tapped', (
      WidgetTester tester,
    ) async {
      var checkedOut = false;
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(showCart: true, showBadgeCart: true),
            totalCart: 10,
            onSearch: () {},
            onCheckout: () {
              checkedOut = true;
            },
            onTapDrawerMenu: () {},
            onTapNotifications: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      final btnCart = find.byWidgetPredicate(
        (Widget widget) =>
            widget is Container &&
            widget.decoration ==
                const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ) &&
            widget.child is Text &&
            widget.alignment == Alignment.center,
      );

      await tester.tap(btnCart);

      await tester.pump();

      expect(checkedOut, isTrue);
    });

    testWidgets('calls onTapDrawerMenu when menu icon is tapped', (
      WidgetTester tester,
    ) async {
      var menuOpened = false;
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(showMenu: true),
            onSearch: () {},
            onCheckout: () {},
            onTapDrawerMenu: () {
              menuOpened = true;
            },
            onTapNotifications: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(find.byType(LogoIcon).at(0));
      await tester.pump();

      expect(menuOpened, isTrue);
    });

    testWidgets('calls onTapDrawerMenu when logo is tapped', (
      WidgetTester tester,
    ) async {
      var menuOpened = false;
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(
              showMenu: true,
              showLogo: true,
              textConfig: TextConfig(
                text: 'Logo',
                fontSize: 20,
                alignment: Alignment.center,
              ),
            ),
            logo: MockConstants.remotePNG,
            onSearch: () {},
            onCheckout: () {},
            onTapDrawerMenu: () {
              menuOpened = true;
            },
            onTapNotifications: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(find.byType(LogoIcon).at(0));
      await tester.pump();

      expect(menuOpened, isTrue);
    });

    testWidgets('calls onTapNotifications when notification icon is tapped', (
      WidgetTester tester,
    ) async {
      var notificationsOpened = false;
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(showNotification: true),
            onSearch: () {},
            onCheckout: () {},
            onTapDrawerMenu: () {},
            onTapNotifications: () {
              notificationsOpened = true;
            },
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      await tester.tap(find.byType(LogoIcon).at(0));
      await tester.pump();

      expect(notificationsOpened, isTrue);
    });

    testWidgets('renders logo when image is provided', (
      WidgetTester tester,
    ) async {
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(image: MockConstants.remotePNG, showLogo: true),
            onSearch: () {},
            onCheckout: () {},
            onTapDrawerMenu: () {},
            onTapNotifications: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byType(FluxImage), findsOneWidget);
    });

    testWidgets('renders logo when logo is provided', (
      WidgetTester tester,
    ) async {
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(showLogo: true),
            logo: MockConstants.remotePNG,
            onSearch: () {},
            onCheckout: () {},
            onTapDrawerMenu: () {},
            onTapNotifications: () {},
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      expect(find.byType(FluxImage), findsOneWidget);
    });

    testWidgets('calls showMultiSiteSelection when multi-site icon is tapped', (
      WidgetTester tester,
    ) async {
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
      final widget = MaterialApp(
        home: Material(
          child: LogoWidget(
            config: LogoConfig(),
            onSearch: () {},
            onCheckout: () {},
            onTapDrawerMenu: () {},
            onTapNotifications: () {},
            multiSiteArgument: MultiSiteArgument(
              enableMultiSite: true,
              multiSiteIcon: MockConstants.remotePNG,
              multiSiteConfig: multiSiteConfigs.first,
              multiSiteConfigs: multiSiteConfigs,
              onSiteChanged: (config) async {},
              onErrorChangeSite: (error) async {},
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(const Duration(seconds: 2));

      final btnChangeSite = find.byType(FluxImage);

      expect(btnChangeSite, findsOneWidget);
    });
  });
}
