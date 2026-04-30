import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ev_charging_finder/core/providers/auth_providers.dart';

void main() {
  test('should_haveCorrectBaseUrl_whenDioProviderIsAccessed', () {
    final container = ProviderContainer();
    final dio = container.read(dioProvider);

    expect(dio.options.baseUrl, 'http://127.0.0.1:8000');
  });
}
