import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/entities/text_config.dart';

void main() {
  group('TextConfig', () {
    test('fromJson should correctly initialize TextConfig object', () {
      final json = {
        'text': 'Hello',
        'fontFamily': 'Arial',
        'fontSize': 18.0,
        'color': '#FF0000',
        'x': 0.5,
        'y': 0.5,
        'enableShadow': true,
      };

      final textConfig = TextConfig.fromJson(json);

      expect(textConfig.text, 'Hello');
      expect(textConfig.fontFamily, 'Arial');
      expect(textConfig.fontSize, 18.0);
      expect(textConfig.color, '#FF0000');
      expect(textConfig.alignment, const Alignment(0.5, 0.5));
      expect(textConfig.enableShadow, true);
    });

    test('toJson should correctly convert TextConfig object to JSON', () {
      final textConfig = TextConfig(
        text: 'Hello',
        fontFamily: 'Arial',
        fontSize: 18.0,
        color: '#FF0000',
        alignment: const Alignment(0.5, 0.5),
        enableShadow: true,
      );

      final json = textConfig.toJson();

      expect(json['text'], 'Hello');
      expect(json['fontFamily'], 'Arial');
      expect(json['fontSize'], 18.0);
      expect(json['color'], '#FF0000');
      expect(json['x'], 0.5);
      expect(json['y'], 0.5);
      expect(json['enableShadow'], true);
    });
  });
}
