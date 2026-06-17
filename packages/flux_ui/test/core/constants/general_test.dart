import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/core/constants/general.dart' as general_constants;
import 'package:flux_ui/src/core/constants/general.dart';

void main() {
  group('General Constants', () {
    test('kIsWeb should be a boolean value', () {
      expect(kIsWeb, isA<bool>());
    });

    test('isIos should be a boolean value', () {
      expect(isIos, isA<bool>());
    });

    test('isAndroid should be a boolean value', () {
      expect(isAndroid, isA<bool>());
    });

    test('isMacOS should be a boolean value', () {
      expect(general_constants.isMacOS, isA<bool>());
    });

    test('isWindow should be a boolean value', () {
      expect(isWindow, isA<bool>());
    });

    test('isFuchsia should be a boolean value', () {
      expect(isFuchsia, isA<bool>());
    });

    test('isMobile should be a boolean value', () {
      expect(isMobile, isA<bool>());
    });

    test('isDesktop should be a boolean value', () {
      expect(isDesktop, isA<bool>());
    });

    test('isMobile should be true if isIOS or isAndroid is true', () {
      expect(isMobile, isFalse);
    });

    test('isDesktop should be true if isMacOS or isWindows is true', () {
      expect(isDesktop, isTrue);
    });
  });
}
