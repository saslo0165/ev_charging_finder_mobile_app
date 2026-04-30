import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

/// Sealed state for the auth feature.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.authenticated({required UserEntity user}) = AuthAuthenticated;
  const factory AuthState.error({required String message}) = AuthError;
}
