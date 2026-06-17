import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/widgets/flux_image.dart';
import 'package:lottie/lottie.dart';

import '../core/mocks/mock_constants.dart';

void main() {
  group('FluxImage', () {
    testWidgets('should display SvgPicture.asset when imageUrl is an SVG', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxImage(
              imageUrl: MockConstants.localSVG,
              width: 100,
              height: 100,
            ),
          ),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
    });

    testWidgets(
      'should display Lottie.asset when imageUrl is a json animation',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxImage(
                imageUrl: MockConstants.localAnimationJSON,
                width: 100,
                height: 100,
              ),
            ),
          ),
        );

        expect(find.byType(Lottie), findsOneWidget);
      },
    );

    testWidgets(
      'should display ExtendedImage.asset when useExtendedImage is true',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxImage(
                imageUrl: MockConstants.localPNG,
                width: 100,
                height: 100,
                useExtendedImage: true,
              ),
            ),
          ),
        );

        expect(find.byType(ExtendedImage), findsOneWidget);
      },
    );

    testWidgets('should display Image.asset when useExtendedImage is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FluxImage(
              imageUrl: MockConstants.localPNG,
              width: 100,
              height: 100,
              useExtendedImage: false,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets(
      'should display Lottie.network when imageUrl is a remote JSON animation',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxImage(
                imageUrl: MockConstants.remoteJSON,
                width: 100,
                height: 100,
              ),
            ),
          ),
        );

        expect(find.byType(Lottie), findsOneWidget);
      },
    );

    testWidgets(
      'should display ExtendedImage.network when useExtendedImage is true and imageUrl is a remote image',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxImage(
                imageUrl: MockConstants.remotePNG,
                width: 100,
                height: 100,
                useExtendedImage: true,
              ),
            ),
          ),
        );

        expect(find.byType(ExtendedImage), findsOneWidget);
      },
    );

    testWidgets(
      'should display Image.network when useExtendedImage is false and imageUrl is a remote image',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: FluxImage(
                imageUrl: MockConstants.remotePNG,
                width: 100,
                height: 100,
                useExtendedImage: false,
              ),
            ),
          ),
        );

        expect(find.byType(Image), findsOneWidget);
      },
    );
  });
}
