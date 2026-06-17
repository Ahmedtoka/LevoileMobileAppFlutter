import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/flux_ui.dart';

void main() {
  group('BoxShadowConfig', () {
    test('fromJson() should correctly initialize the properties', () {
      final json = {
        'blurRadius': 5.0,
        'colorOpacity': 0.2,
        'spreadRadius': 8.0,
        'x': 2.0,
        'y': 3.0,
      };

      final boxShadowConfig = BoxShadowConfig.fromJson(json);

      expect(boxShadowConfig.blurRadius, equals(5.0));
      expect(boxShadowConfig.colorOpacity, equals(0.2));
      expect(boxShadowConfig.spreadRadius, equals(8.0));
      expect(boxShadowConfig.x, equals(2.0));
      expect(boxShadowConfig.y, equals(3.0));
    });

    test('toJson() should correctly convert the object to a JSON map', () {
      final boxShadowConfig = BoxShadowConfig(
        blurRadius: 5.0,
        colorOpacity: 0.2,
        spreadRadius: 8.0,
        x: 2.0,
        y: 3.0,
      );

      final json = boxShadowConfig.toJson();

      expect(json['blurRadius'], equals(5.0));
      expect(json['colorOpacity'], equals(0.2));
      expect(json['spreadRadius'], equals(8.0));
      expect(json['x'], equals(2.0));
      expect(json['y'], equals(3.0));
    });
  });
}
