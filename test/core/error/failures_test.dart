import 'package:flutter_test/flutter_test.dart';
import 'package:ev_charging_finder/core/error/failures.dart';

void main() {
  group('Failures', () {
    test('should_holdMessage_whenNetworkFailureCreated', () {
      const failure = NetworkFailure(message: 'No internet');
      expect(failure.message, 'No internet');
    });

    test('should_holdMessageAndCode_whenServerFailureCreated', () {
      const failure = ServerFailure(message: 'Unauthorized', statusCode: 401);
      expect(failure.message, 'Unauthorized');
      expect(failure.statusCode, 401);
    });

    test('should_holdMessage_whenValidationFailureCreated', () {
      const failure = ValidationFailure(message: 'Invalid OTP');
      expect(failure.message, 'Invalid OTP');
    });
  });
}
