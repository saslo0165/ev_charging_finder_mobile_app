// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StationSearchNotifier)
final stationSearchProvider = StationSearchNotifierProvider._();

final class StationSearchNotifierProvider
    extends
        $NotifierProvider<
          StationSearchNotifier,
          AsyncValue<StationSearchResponse?>
        > {
  StationSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationSearchNotifierHash();

  @$internal
  @override
  StationSearchNotifier create() => StationSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<StationSearchResponse?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<StationSearchResponse?>>(
        value,
      ),
    );
  }
}

String _$stationSearchNotifierHash() =>
    r'92d7f68a3e9414bb1d58a7f9854bb03e8c00a664';

abstract class _$StationSearchNotifier
    extends $Notifier<AsyncValue<StationSearchResponse?>> {
  AsyncValue<StationSearchResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<StationSearchResponse?>,
              AsyncValue<StationSearchResponse?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<StationSearchResponse?>,
                AsyncValue<StationSearchResponse?>
              >,
              AsyncValue<StationSearchResponse?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
