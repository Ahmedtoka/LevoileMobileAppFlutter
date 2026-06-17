import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/core/extensions/string_ext.dart';

void main() {
  group('FluxDynamicStringExt', () {
    test('addWebProxy should add web proxy to the URL', () {
      const url = 'https://example.com';
      const webProxy = 'https://proxy.com';

      final result = url.addWebProxy(webProxy: webProxy);

      if (kIsWeb) {
        expect(result, 'https://proxy.comexample.com');
      } else {
        expect(result, url);
      }
    });

    test('addWebProxy should return the same URL if kIsWeb is false', () {
      const url = 'https://example.com';
      const webProxy = 'https://proxy.com';

      final result = url.addWebProxy(webProxy: webProxy);

      expect(result, url);
    });

    test(
      'addWebProxy should return the same URL if webProxy is null or empty',
      () {
        const url = 'https://example.com';

        final result1 = url.addWebProxy(webProxy: null);
        final result2 = url.addWebProxy(webProxy: '');

        expect(result1, url);
        expect(result2, url);
      },
    );
    test(
      'addWebProxy should return url without webProxy if isForceUseProxy is true',
      () {
        const url = 'https://example.com';
        const webProxy = 'https://proxy.com/';

        final result = url.addWebProxy(
          webProxy: webProxy,
          isForceUseProxy: true,
        );

        expect(result, 'https://proxy.com/example.com');
      },
    );
    test(
      'addWebProxy should return the same URL if webProxy already exists in the URL',
      () {
        const url = 'https://proxy.comexample.com';
        const webProxy = 'https://proxy.com';

        final result = url.addWebProxy(
          webProxy: webProxy,
          isForceUseProxy: true,
        );

        expect(result, url);
      },
    );
  });
}
