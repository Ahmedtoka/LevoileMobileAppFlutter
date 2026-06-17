import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/entities/featured_vendor/featured_vendor_config.dart';

void main() {
  group('FeaturedVendorConfig', () {
    test('fromJson should correctly deserialize JSON', () {
      final json = {
        'name': 'Vendor Name',
        'columnCount': 4,
        'showRating': false,
        'enableAutoSliding': true,
        'durationAutoSliding': 5000,
        'enableBackground': true,
        'isSnapping': false,
        'limit': 10,
        'imageBoxfit': 'contain',
        'alignment': 'center',
      };

      final config = FeaturedVendorConfig.fromJson(json);

      expect(config.name, 'Vendor Name');
      expect(config.columnCount, 4);
      expect(config.showRating, false);
      expect(config.enableAutoSliding, true);
      expect(config.durationAutoSliding, 5000);
      expect(config.enableBackground, true);
      expect(config.isSnapping, false);
      expect(config.limit, 10);
      expect(config.imageBoxfit, 'contain');
      expect(config.alignment, 'center');
    });

    test('fromJson should use default values if JSON is missing fields', () {
      final json = {};

      final config = FeaturedVendorConfig.fromJson(
        Map<String, dynamic>.from(json),
      );

      expect(config.name, isNull);
      expect(config.columnCount, 3);
      expect(config.showRating, true);
      expect(config.enableAutoSliding, false);
      expect(config.durationAutoSliding, isNull);
      expect(config.enableBackground, false);
      expect(config.isSnapping, false);
      expect(config.limit, isNull);
      expect(config.imageBoxfit, 'cover');
      expect(config.alignment, 'centerStart');
    });
  });
}
