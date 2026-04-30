// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Data Transfer Object — only lives in the data layer.
/// Never passed into domain directly; use [toDomain()] to convert.
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    String? phone,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    @JsonKey(name: 'is_guest') required bool isGuest,
    @JsonKey(name: 'is_active') required bool isActive,
    required String role,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    String? accessToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Converts DTO → Domain entity. Never pass UserModel into domain layer.
  UserEntity toDomain() => UserEntity(
        id: id,
        fullName: fullName,
        email: email,
        phone: phone,
        avatarUrl: avatarUrl,
        isGuest: isGuest,
        isActive: isActive,
        role: role,
        createdAt: createdAt,
        accessToken: accessToken,
      );
}
