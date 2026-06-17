// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flux_localization/flux_localization.dart';
// import 'package:flux_ui/flux_ui.dart';

// import '../../core/mocks/mock_constants.dart';
// import '../../core/mocks/mock_navigator_observer.dart';

// void main() {
//   group('MultiSiteSelectionScreen', () {
//     final multiSiteConfigs = [
//       const MultiSiteConfig(
//         name: 'Example Site 1',
//         icon: MockConstants.remotePNG,
//       ),
//       const MultiSiteConfig(
//         name: 'Example Site 2',
//         icon: MockConstants.remotePNG,
//       ),
//       const MultiSiteConfig(
//         name: 'Example Site 3',
//         icon: MockConstants.remotePNG,
//       ),
//     ];

//     testWidgets('renders MultiSiteSelection', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           localizationsDelegates: const [
//             AppLocalization.delegate,
//             LocalWidgetLocalizations.delegate,
//             SubMaterialLocalizations.delegate,
//             SubCupertinoLocalizations.delegate,
//           ],
//           home: MultiSiteSelectionScreen(
//             config: null,
//             multiSiteConfigs: multiSiteConfigs,
//             onChanged: (config) async {},
//             onError: (error) async {},
//           ),
//         ),
//       );
//       await tester.pump(const Duration(seconds: 2));

//       expect(find.byType(MultiSiteSelection), findsOneWidget);
//     });

//     testWidgets('applies selected site on button press',
//         (WidgetTester tester) async {
//       MultiSiteConfig? selectedConfig;

//       await tester.pumpWidget(
//         MaterialApp(
//           localizationsDelegates: const [
//             AppLocalization.delegate,
//             LocalWidgetLocalizations.delegate,
//             SubMaterialLocalizations.delegate,
//             SubCupertinoLocalizations.delegate,
//           ],
//           home: MultiSiteSelectionScreen(
//             config: null,
//             multiSiteConfigs: multiSiteConfigs,
//             onChanged: (config) async {
//               selectedConfig = config;
//             },
//             onError: (error) async {},
//           ),
//         ),
//       );
//       await tester.pump(const Duration(seconds: 2));

//       // Select the second site
//       await tester.tap(find.text('Example Site 2'));
//       await tester.pump();

//       // Tap the apply button
//       await tester.tap(find.text('Apply'));
//       await tester.pump();

//       // Verify that the selected site is applied
//       expect(selectedConfig, equals(multiSiteConfigs[1]));
//     });

//     testWidgets('pops the screen on successful apply',
//         (WidgetTester tester) async {
//       var popCalled = false;

//       await tester.pumpWidget(
//         MaterialApp(
//           localizationsDelegates: const [
//             AppLocalization.delegate,
//             LocalWidgetLocalizations.delegate,
//             SubMaterialLocalizations.delegate,
//             SubCupertinoLocalizations.delegate,
//           ],
//           home: MultiSiteSelectionScreen(
//             config: multiSiteConfigs.first,
//             multiSiteConfigs: multiSiteConfigs,
//             onChanged: (config) async {},
//             onError: (error) async {},
//           ),
//           navigatorObservers: [
//             MockNavigatorObserver(action: (route) {
//               popCalled = true;
//             }),
//           ],
//         ),
//       );
//       await tester.pump(const Duration(seconds: 2));

//       // Select the second site
//       await tester.tap(find.text('Example Site 2'));
//       await tester.pump();

//       // Tap the apply button
//       await tester.tap(find.text('Apply'));
//       await tester.pump();

//       // Verify that the screen is popped
//       expect(popCalled, isTrue);
//     });
//   });
// }
