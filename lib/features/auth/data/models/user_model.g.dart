// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  isGuest: json['is_guest'] as bool,
  isActive: json['is_active'] as bool,
  role: json['role'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  accessToken: json['accessToken'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'avatar_url': instance.avatarUrl,
      'is_guest': instance.isGuest,
      'is_active': instance.isActive,
      'role': instance.role,
      'created_at': instance.createdAt.toIso8601String(),
      'accessToken': instance.accessToken,
    };
