import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/get_me_usecase.dart';
import '../../features/auth/domain/usecases/update_profile_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
// import '../../features/auth/domain/usecases/verify_otp_usecase.dart';

// ── Network ────────────────────────────────────────────────────────────────

final dioProvider = Provider<Dio>((ref) {
  // Use your computer's local IP to access the server from a real device.
  return Dio(BaseOptions(
    baseUrl: 'https://evchargingfinderbackend-production.up.railway.app',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));
});

// ── Data Sources ────────────────────────────────────────────────────────────

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(dioProvider));
});

// ── Repository ──────────────────────────────────────────────────────────────

/// Override in tests: authRepositoryProvider.overrideWithValue(mockRepo)
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

// ── Use-Cases ────────────────────────────────────────────────────────────────

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  return RegisterUseCase(ref.read(authRepositoryProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final getMeUseCaseProvider = Provider<GetMeUseCase>((ref) {
  return GetMeUseCase(ref.read(authRepositoryProvider));
});

final updateProfileUseCaseProvider = Provider<UpdateProfileUseCase>((ref) {
  return UpdateProfileUseCase(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(authRepositoryProvider));
});

// final verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>((ref) {
//   return VerifyOtpUseCase(ref.read(authRepositoryProvider));
// });
