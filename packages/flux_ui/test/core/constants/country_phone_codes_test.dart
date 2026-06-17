import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

void main() {
  // Add your test cases here
  test('Test countryPhoneCodes', () {
    expect(countryPhoneCodes, isList);
    expect(countryPhoneCodes, isNotEmpty);
    expect(countryPhoneCodes.length, equals(249));
    expect(countryPhoneCodes[0], containsPair('name', 'Afghanistan'));
    expect(countryPhoneCodes[0], containsPair('dial_code', '+93'));
    expect(countryPhoneCodes[0], containsPair('code', 'AF'));
    // Add more assertions as needed
  });
}
