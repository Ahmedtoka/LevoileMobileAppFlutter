import 'package:flutter_test/flutter_test.dart';
import 'package:fstore/common/config.dart';
import 'package:fstore/env.dart';

/// Le Voile: cover for how a product option is NAMED and DRAWN.
///
/// Striped Tank Top keeps its colours in Shopify under an option called
/// "Style" with the values 1 / 2 / 3, while Striped Denim Dress keeps them
/// under "Color". Both maps below are keyed by that Shopify name, so the
/// tank top fell through to the default and the customer was offered three
/// numbered boxes with no picture of what they were choosing — next to a
/// dress that showed proper photo swatches.
///
/// These assertions run the config through the same call main.dart makes, so
/// they fail if the entries are dropped OR if the wiring from env.dart to the
/// `k...` getters ever stops working.
void main() {
  setUpAll(() => Configurations().setConfigurationValues(environment));

  test('a Style option is drawn the same way a Color option is', () {
    expect(kProductVariantLayout['color'], 'imageDropdown');
    expect(
      kProductVariantLayout['style'],
      kProductVariantLayout['color'],
      reason: 'a colour picker must not depend on which of the two names the '
          'shop happened to give the option',
    );
  });

  test('a Style option is headed Colour in every language the app ships', () {
    for (final lang in ['en', 'ar', 'vi']) {
      final names = kProductVariantLanguage[lang] as Map;
      expect(
        names['style'],
        names['color'],
        reason: 'heading mismatch in "$lang": the customer would pick under '
            'one word and see the cart use another',
      );
    }
  });

  test('Size is left alone as plain boxes', () {
    // Guards the patch from creeping: only the colour naming was wrong.
    expect(kProductVariantLayout['size'], 'box');
  });
}
