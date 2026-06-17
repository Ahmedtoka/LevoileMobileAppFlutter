// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flux_localization/flux_localization.dart';
// import 'package:flux_ui/src/dynamic_layout/multi_site/multi_site_mixin.dart';

// class MultiSiteMixinTest with MultiSiteMixin {}

// void main() {
//   group('MultiSiteMixin', () {
//     testWidgets('showMultiSiteSelection should show modal bottom sheet',
//         (WidgetTester tester) async {
//       final testWidget = MultiSiteMixinTest();

//       await tester.pumpWidget(
//         MaterialApp(
//           localizationsDelegates: const [
//             AppLocalization.delegate,
//             LocalWidgetLocalizations.delegate,
//             SubMaterialLocalizations.delegate,
//             SubCupertinoLocalizations.delegate,
//           ],
//           home: Scaffold(
//             body: Builder(
//               builder: (BuildContext context) {
//                 return Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       testWidget.showMultiSiteSelection(
//                         context,
//                         config: null,
//                         multiSiteConfigs: [],
//                         onChanged: (config) async {},
//                         onError: (error) async {},
//                       );
//                     },
//                     child: const Text('Show MultiSite Selection'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       );
//       await tester.pump(const Duration(seconds: 2));
//       await tester.tap(find.text('Show MultiSite Selection'));
//       await tester.pumpAndSettle();

//       expect(find.byType(MultiSiteSelectionContent), findsOneWidget);
//     });
//   });
// }
