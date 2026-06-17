import 'package:flutter_test/flutter_test.dart';
import 'package:flux_ui/src/entities/enums/replaced_params.dart';

void main() {
  group('ReplacedParams', () {
    test('should have the correct parameter value', () {
      final param = ReplacedParams.userName.param;
      expect(param, '{name}');
    });
  });
}
