// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides [AuthNotifier] — reads use-cases from the provider graph.
/// In tests, override [authRepositoryProvider] to inject a mock repository,
/// which flows through the use-case providers automatically.

@ProviderFor(AuthNotifier)
final authProvider = AuthNotifierProvider._();

/// Provides [AuthNotifier] — reads use-cases from the provider graph.
/// In tests, override [authRepositoryProvider] to inject a mock repository,
/// which flows through the use-case providers automatically.
final class AuthNotifierProvider
    extends $NotifierProvider<AuthNotifier, AsyncValue<AuthState>> {
  /// Provides [AuthNotifier] — reads use-cases from the provider graph.
  /// In tests, override [authRepositoryProvider] to inject a mock repository,
  /// which flows through the use-case providers automatically.
  AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<AuthState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<AuthState>>(value),
    );
  }
}

String _$authNotifierHash() => r'4ec666478488da5b6cb495602b8b69f3966338bd';

/// Provides [AuthNotifier] — reads use-cases from the provider graph.
/// In tests, override [authRepositoryProvider] to inject a mock repository,
/// which flows through the use-case providers automatically.

abstract class _$AuthNotifier extends $Notifier<AsyncValue<AuthState>> {
  AsyncValue<AuthState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthState>, AsyncValue<AuthState>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthState>, AsyncValue<AuthState>>,
              AsyncValue<AuthState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
