import 'package:flutter_test/flutter_test.dart';
import 'package:ev_charging_finder/features/auth/data/models/user_model.dart';

void main() {
  const tJson = {
    "id": 6,
    "full_name": "Shashank",
    "email": "shashank@gmail.com",
    "phone": "1234567890",
    "avatar_url": null,
    "is_guest": false,
    "is_active": true,
    "role": "user",
    "created_at": "2026-04-29T12:21:19.067902+05:30"
  };

  test('should_returnValidModel_fromJson', () {
    final result = UserModel.fromJson(tJson);

    expect(result.id, 6);
    expect(result.fullName, "Shashank");
    expect(result.email, "shashank@gmail.com");
  });

  test('should_mapToDomainEntityCorrectly', () {
    final model = UserModel.fromJson(tJson);
    final entity = model.toDomain();

    expect(entity.id, 6);
    expect(entity.fullName, "Shashank");
    expect(entity.createdAt, DateTime.parse("2026-04-29T12:21:19.067902+05:30"));
  });
}
