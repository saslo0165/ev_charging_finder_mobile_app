import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// Domain entity — no Flutter imports, no Dio, no DTO leakage.
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String fullName,
    required String email,
    String? phone,
    required String? avatarUrl,
    required bool isGuest,
    required bool isActive,
    required String role,
    required DateTime createdAt,
    String? accessToken,
  }) = _UserEntity;
}
