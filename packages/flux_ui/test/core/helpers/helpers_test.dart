import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/core/helpers/helpers.dart';

void main() {
  group('Helper', () {
    test('formatDouble should convert String to double', () {
      expect(FluxUiHelper.formatDouble('3.14'), 3.14);
      expect(FluxUiHelper.formatDouble('5'), 5.0);
      expect(FluxUiHelper.formatDouble(10), 10.0);
      expect(FluxUiHelper.formatDouble(7.5), 7.5);
      expect(FluxUiHelper.formatDouble(null), null);
      expect(FluxUiHelper.formatDouble(''), null);
    });

    test('formatDouble should return defaultValue if conversion fails', () {
      expect(FluxUiHelper.formatDouble('abc', 0.0), 0.0);
    });

    test('formatInt should convert String to int', () {
      expect(FluxUiHelper.formatInt('10'), 10);
      expect(FluxUiHelper.formatInt(5), 5);
      expect(FluxUiHelper.formatInt(3.14), 3);
      expect(FluxUiHelper.formatInt(null, 0), 0);
      expect(FluxUiHelper.formatInt(''), null);
    });

    test('formatInt should return defaultValue if conversion fails', () {
      expect(FluxUiHelper.formatInt('abc', 0), 0);
    });

    test('boxFit should return the correct BoxFit', () {
      expect(FluxUiHelper.boxFit('contain'), BoxFit.contain);
      expect(FluxUiHelper.boxFit('fill'), BoxFit.fill);
      expect(FluxUiHelper.boxFit('fitHeight'), BoxFit.fitHeight);
      expect(FluxUiHelper.boxFit('fitWidth'), BoxFit.fitWidth);
      expect(FluxUiHelper.boxFit('scaleDown'), BoxFit.scaleDown);
      expect(FluxUiHelper.boxFit('cover'), BoxFit.cover);
      expect(
        FluxUiHelper.boxFit(null, defaultValue: BoxFit.fitWidth),
        BoxFit.fitWidth,
      );
      expect(
        FluxUiHelper.boxFit('unknown', defaultValue: BoxFit.fitWidth),
        BoxFit.fitWidth,
      );
    });

    test('compactNumberFormat should format numbers correctly', () {
      expect(FluxUiHelper.compactNumberFormat(500), '500.0');
      expect(FluxUiHelper.compactNumberFormat(10000), '10K');
      expect(FluxUiHelper.compactNumberFormat(150000), '150K');
      expect(FluxUiHelper.compactNumberFormat(1000000), '1M');
      expect(FluxUiHelper.compactNumberFormat(5000000), '5M');
      expect(FluxUiHelper.compactNumberFormat(10000000), '10M');
      expect(FluxUiHelper.compactNumberFormat(1000000000), '1B');
      expect(FluxUiHelper.compactNumberFormat(5000000000), '5B');
      expect(FluxUiHelper.compactNumberFormat(10000000000), '10B');
      expect(FluxUiHelper.compactNumberFormat(1234567890), '1.23B');
      expect(FluxUiHelper.compactNumberFormat('abc'), '0.0');
    });
  });
}
