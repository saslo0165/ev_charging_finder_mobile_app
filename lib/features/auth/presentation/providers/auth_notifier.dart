import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
// import '../../domain/usecases/verify_otp_usecase.dart';
import '../../../../core/providers/auth_providers.dart';
import '../../../../core/providers/storage_provider.dart';
import 'auth_state.dart';

part 'auth_notifier.g.dart';

/// Provides [AuthNotifier] — reads use-cases from the provider graph.
/// In tests, override [authRepositoryProvider] to inject a mock repository,
/// which flows through the use-case providers automatically.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  bool _mounted = true;

  @override
  AsyncValue<AuthState> build() {
    ref.onDispose(() => _mounted = false);
    // Start in loading state while we restore the session
    Future.microtask(() => _restoreSession());
    return const AsyncLoading();
  }

  Future<void> _restoreSession() async {
    // 1. Capture dependencies BEFORE any await to avoid using 'ref' after disposal
    final storage = ref.read(storageServiceProvider);
    final getMeUseCase = ref.read(getMeUseCaseProvider);

    try {
      final token = await storage.getToken();
      
      // 2. CHECK MOUNTED after every await
      if (!ref.mounted) return;
      
      print('DEBUG: Restoring session, token found: ${token != null}');
      
      if (token != null) {
        // Use the captured useCase instead of ref.read again
        final result = await getMeUseCase(token);
        
        if (!ref.mounted) return;

        state = result.fold(
          (failure) {
            storage.removeToken();
            print('DEBUG: Restoration failed via API: ${failure.message}');
            return AsyncData(AuthState.error(message: failure.message));
          },
          (user) {
            print('DEBUG: Restoration success for: ${user.fullName}');
            return AsyncData(AuthState.authenticated(user: user));
          },
        );
      } else {
        print('DEBUG: No token found, setting state to initial');
        state = const AsyncData(AuthState.initial());
      }
    } catch (e) {
      print('DEBUG: Session restoration exception: $e');
      if (ref.mounted) {
        state = const AsyncData(AuthState.initial());
      }
    }
  }

  Future<void> register({
    required String fullName,
    required String phone,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(registerUseCaseProvider);
    final result = await useCase(
      RegisterParams(
        email: email,
        fullName: fullName,
        isGuest: false, // Hardcoded for now
        password: password,
        phone: phone,
        role: 'user', // Hardcoded for now
      ),
    );
    
    if (!_mounted) return;
    
    final authState = await result.fold(
      (failure) async => AuthState.error(message: failure.message),
      (user) async {
        if (user.accessToken != null && _mounted) {
          await ref.read(storageServiceProvider).saveToken(user.accessToken!);
        }
        return AuthState.authenticated(user: user);
      },
    );

    if (_mounted) state = AsyncData(authState);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final useCase = ref.read(loginUseCaseProvider);
    final result = await useCase(
      LoginParams(
        email: email,
        password: password,
      ),
    );
    
    if (!_mounted) return;

    final authState = await result.fold(
      (failure) async => AuthState.error(message: failure.message),
      (user) async {
        if (user.accessToken != null && _mounted) {
          await ref.read(storageServiceProvider).saveToken(user.accessToken!);
        }
        return AuthState.authenticated(user: user);
      },
    );

    if (_mounted) state = AsyncData(authState);
  }
  Future<void> getMe([String? token]) async {
    String? currentToken = token;
    
    if (currentToken == null) {
      final authState = state.value;
      if (authState is AuthAuthenticated) {
        currentToken = authState.user.accessToken;
      }
    }
    
    if (currentToken == null) return;

    state = const AsyncLoading();
    final useCase = ref.read(getMeUseCaseProvider);
    final result = await useCase(currentToken);

    if (!_mounted) return;
    state = result.fold(
      (failure) {
        // If token is invalid, clear it
        if (_mounted) {
          ref.read(storageServiceProvider).removeToken();
        }
        return AsyncData(AuthState.error(message: failure.message));
      },
      (user) => AsyncData(AuthState.authenticated(user: user)),
    );
  }

  Future<void> updateProfile({
    required String fullName,
    required String phone,
  }) async {
    final currentAuthState = state.value;
    if (currentAuthState is! AuthAuthenticated) return;

    final token = currentAuthState.user.accessToken;
    if (token == null) return;

    state = const AsyncLoading();
    final useCase = ref.read(updateProfileUseCaseProvider);
    
    final result = await useCase(
      UpdateProfileParams(
        token: token,
        fullName: fullName,
        phone: phone,
      ),
    );

    if (!_mounted) return;

    state = result.fold(
      (failure) => AsyncData(AuthState.error(message: failure.message)),
      (user) {
        // Preserve the token if the backend didn't return a new one
        final updatedUser = user.accessToken == null 
            ? user.copyWith(accessToken: token) 
            : user;
        return AsyncData(AuthState.authenticated(user: updatedUser));
      },
    );
  }

  Future<void> logout() async {
    final currentAuthState = state.value;
    if (currentAuthState is AuthAuthenticated) {
      final token = currentAuthState.user.accessToken;
      if (token != null) {
        // We don't necessarily need to wait for server-side logout to complete 
        // or handle its error for the user to be logged out locally,
        // but we should at least trigger it.
        final logoutUseCase = ref.read(logoutUseCaseProvider);
        await logoutUseCase(token);
      }
    }
    
    await ref.read(storageServiceProvider).removeToken();
    state = const AsyncData(AuthState.initial());
  }

  // Future<void> verifyOtp({
  //   required String email,
  //   required String otp,
  // }) async {
  //   state = const AsyncLoading();
  //   final useCase = ref.read(verifyOtpUseCaseProvider);
  //   final result = await useCase(
  //     VerifyOtpParams(email: email, otp: otp),
  //   );
  //   state = result.fold(
  //     (failure) => AsyncData(AuthState.error(message: failure.message)),
  //     (user) => AsyncData(AuthState.authenticated(user: user)),
  //   );
  // }
}
