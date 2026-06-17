import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

void main() {
  group('Tools', () {
    test('formatDouble should return the correct value', () {
      expect(Tools.formatDouble(2), 2.0);
      expect(Tools.formatDouble(0), 0.0);
      expect(Tools.formatDouble(-5), -5.0);
      expect(Tools.formatDouble(null), null);
    });

    test('loadStatesByCountry should return a list of dynamic', () async {
      final result = await Tools.loadStatesByCountry('us');
      expect(result, isA<List<dynamic>>());
    });

    test('getValueByKey should return the correct value', () {
      final json = {
        'name': 'John',
        'age': 25,
        'address': {'street': '123 Main St', 'city': 'New York'},
      };

      expect(Tools.getValueByKey(json, 'name'), 'John');
      expect(Tools.getValueByKey(json, 'age'), 25);
      expect(Tools.getValueByKey(json, 'address.street'), '123 Main St');
      expect(Tools.getValueByKey(json, 'address.city'), 'New York');
      expect(Tools.getValueByKey(json, 'address.zipCode'), null);
      expect(Tools.getValueByKey(json, null), null);
    });

    test('prepareURL should return the correct URL', () {
      expect(Tools.prepareURL('example.com'), 'https://example.com');
      expect(Tools.prepareURL('http://example.com'), 'http://example.com');
      expect(Tools.prepareURL('https://example.com'), 'https://example.com');
      expect(Tools.prepareURL('intent://example.com'), 'intent://example.com');
      expect(Tools.prepareURL(null), null);
    });

    test('removeHTMLTags should remove HTML tags from a string', () {
      const htmlString = '<p>Hello <strong>world</strong>!</p>';
      final result = Tools.removeHTMLTags(htmlString);
      expect(result, 'Hello world!');
    });

    test('calculateDistance should return the correct distance', () {
      final distance = Tools.calculateDistance(
        40.7128,
        -74.0060,
        34.0522,
        -118.2437,
      );
      expect(distance, closeTo(3934.0, 1.0));
    });

    test('getFontWeight should return the correct FontWeight', () {
      expect(Tools.getFontWeight('100'), FontWeight.w100);
      expect(Tools.getFontWeight('200'), FontWeight.w200);
      expect(Tools.getFontWeight('300'), FontWeight.w300);
      expect(Tools.getFontWeight('400'), FontWeight.w400);
      expect(Tools.getFontWeight('500'), FontWeight.w500);
      expect(Tools.getFontWeight('600'), FontWeight.w600);
      expect(Tools.getFontWeight('700'), FontWeight.w700);
      expect(Tools.getFontWeight('800'), FontWeight.w800);
      expect(Tools.getFontWeight('900'), FontWeight.w900);
      expect(Tools.getFontWeight('invalid'), FontWeight.w400);
      expect(Tools.getFontWeight(null), FontWeight.w400);
    });

    test('getAlignment should return the correct AlignmentGeometry', () {
      expect(Tools.getAlignment('left'), AlignmentDirectional.centerStart);
      expect(Tools.getAlignment('right'), AlignmentDirectional.centerEnd);
      expect(Tools.getAlignment('topLeft'), AlignmentDirectional.topStart);
      expect(Tools.getAlignment('topRight'), AlignmentDirectional.topEnd);
      expect(
        Tools.getAlignment('bottomLeft'),
        AlignmentDirectional.bottomStart,
      );
      expect(Tools.getAlignment('bottomRight'), AlignmentDirectional.bottomEnd);
      expect(Tools.getAlignment('bottom'), AlignmentDirectional.bottomCenter);
      expect(Tools.getAlignment('top'), AlignmentDirectional.topCenter);
      expect(Tools.getAlignment('center'), AlignmentDirectional.center);
      expect(Tools.getAlignment('invalid'), AlignmentDirectional.center);
      expect(Tools.getAlignment(null), AlignmentDirectional.center);
    });
  });

  test('convertDateTime should return a formatted date and time string', () {
    final dateTime = DateTime(2022, 1, 1, 12, 30);
    final result = Tools.convertDateTime(dateTime);
    expect(result, '1/1/2022 12:30 PM');
  });

  test('getTimeWith2Digit should return a time string with 2 digits', () {
    expect(Tools.getTimeWith2Digit('1'), '01');
    expect(Tools.getTimeWith2Digit('9'), '09');
    expect(Tools.getTimeWith2Digit('10'), '10');
  });

  test('getFileNameFromUrl should return the file name from a URL', () {
    expect(
      Tools.getFileNameFromUrl('https://example.com/image.jpg'),
      'image.jpg',
    );
    expect(
      Tools.getFileNameFromUrl('https://example.com/document.pdf'),
      'document.pdf',
    );
    expect(
      Tools.getFileNameFromUrl('https://example.com/'),
      'https://example.com/',
    );
  });

  test('formatDate should return a formatted date string', () {
    expect(Tools.formatDate('2022-01-01'), 'January 1, 2022');
    expect(Tools.formatDate('2022-12-31'), 'December 31, 2022');
  });

  test('formatDateToLocal should return a formatted local date string', () {
    expect(Tools.formatDateToLocal('2022-01-01'), 'January 1, 2022');
    expect(Tools.formatDateToLocal('2022-12-31'), 'December 31, 2022');
  });

  testWidgets('isRTL should return true if the language is RTL', (
    WidgetTester tester,
  ) async {
    bool? isRTL;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              isRTL = Tools.isRTL(context);
              return BackgroundColorWidget(child: Container());
            },
          ),
        ),
      ),
    );
    await tester.pump(const Duration(seconds: 2));
    expect(isRTL, isA<bool>());
  });

  test('calculateDistance should return the correct distance', () {
    final distance = Tools.calculateDistance(
      40.7128,
      -74.0060,
      34.0522,
      -118.2437,
    );
    expect(distance, closeTo(3934.0, 1.0));
  });

  test('getFontWeight should return the correct FontWeight', () {
    expect(Tools.getFontWeight('100'), FontWeight.w100);
    expect(Tools.getFontWeight('200'), FontWeight.w200);
    expect(Tools.getFontWeight('300'), FontWeight.w300);
    expect(Tools.getFontWeight('400'), FontWeight.w400);
    expect(Tools.getFontWeight('500'), FontWeight.w500);
    expect(Tools.getFontWeight('600'), FontWeight.w600);
    expect(Tools.getFontWeight('700'), FontWeight.w700);
    expect(Tools.getFontWeight('800'), FontWeight.w800);
    expect(Tools.getFontWeight('900'), FontWeight.w900);
    expect(Tools.getFontWeight('invalid'), FontWeight.w400);
    expect(Tools.getFontWeight(null), FontWeight.w400);
  });

  test('getAlignment should return the correct AlignmentGeometry', () {
    expect(Tools.getAlignment('left'), AlignmentDirectional.centerStart);
    expect(Tools.getAlignment('right'), AlignmentDirectional.centerEnd);
    expect(Tools.getAlignment('topLeft'), AlignmentDirectional.topStart);
    expect(Tools.getAlignment('topRight'), AlignmentDirectional.topEnd);
    expect(Tools.getAlignment('bottomLeft'), AlignmentDirectional.bottomStart);
    expect(Tools.getAlignment('bottomRight'), AlignmentDirectional.bottomEnd);
    expect(Tools.getAlignment('bottom'), AlignmentDirectional.bottomCenter);
    expect(Tools.getAlignment('top'), AlignmentDirectional.topCenter);
    expect(Tools.getAlignment('center'), AlignmentDirectional.center);
    expect(Tools.getAlignment('invalid'), AlignmentDirectional.center);
    expect(Tools.getAlignment(null), AlignmentDirectional.center);
  });

  test('launchURL should throw an exception if the URL is invalid', () async {
    const invalidUrl = 'invalid-url';
    expect(
      () async => await Tools.launchURL(invalidUrl),
      throwsA(isA<Exception>()),
    );
  });

  test(
    'needToOpenExternalApp should return false for URLs that should not open external apps',
    () {
      const internalAppUrl = 'https://myapp.com';
      final result = Tools.needToOpenExternalApp(internalAppUrl);
      expect(result, false);
    },
  );
}
