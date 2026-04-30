import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

// ignore: unintended_html_in_doc_comment
/// Sealed failure hierarchy — used as Left<Failure> in fpdart Either.
@freezed
abstract class Failure with _$Failure {
  const Failure._();

  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.server({
    required String message,
    required int statusCode,
  }) = ServerFailure;

  const factory Failure.validation({required String message}) = ValidationFailure;

  const factory Failure.unknown({required String message}) = UnknownFailure;

  /// Convenience getter — works on every variant without pattern matching.
  @override
  String get message {
    final self = this;
    if (self is NetworkFailure) return self.message;
    if (self is ServerFailure) return self.message;
    if (self is ValidationFailure) return self.message;
    if (self is UnknownFailure) return self.message;
    return 'Unknown error';
  }
}
