import 'package:flutter_test/flutter_test.dart';
import 'package:ev_charging_finder/features/auth/domain/entities/user_entity.dart';

void main() {
  test('should_supportNewFields_whenUserEntityIsCreated', () {
    final tCreatedAt = DateTime.parse('2026-04-29T12:21:19.067902+05:30');
    final user = UserEntity(
      id: 6,
      fullName: 'Shashank',
      email: 'shashank@gmail.com',
      phone: '1234567890',
      avatarUrl: null,
      isGuest: false,
      isActive: true,
      role: 'user',
      createdAt: tCreatedAt,
    );

    expect(user.id, 6);
    expect(user.fullName, 'Shashank');
    expect(user.email, 'shashank@gmail.com');
    expect(user.phone, '1234567890');
    expect(user.avatarUrl, isNull);
    expect(user.isGuest, false);
    expect(user.isActive, true);
    expect(user.role, 'user');
    expect(user.createdAt, tCreatedAt);
  });
}
