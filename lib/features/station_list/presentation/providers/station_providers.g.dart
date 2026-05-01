// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(stationRemoteDataSource)
final stationRemoteDataSourceProvider = StationRemoteDataSourceProvider._();

final class StationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          StationRemoteDataSource,
          StationRemoteDataSource,
          StationRemoteDataSource
        >
    with $Provider<StationRemoteDataSource> {
  StationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<StationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationRemoteDataSource create(Ref ref) {
    return stationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationRemoteDataSource>(value),
    );
  }
}

String _$stationRemoteDataSourceHash() =>
    r'3b0b6a6bb5d17dd608609dfc37ed57343a7f2443';

@ProviderFor(stationRepository)
final stationRepositoryProvider = StationRepositoryProvider._();

final class StationRepositoryProvider
    extends
        $FunctionalProvider<
          StationRepository,
          StationRepository,
          StationRepository
        >
    with $Provider<StationRepository> {
  StationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'stationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$stationRepositoryHash();

  @$internal
  @override
  $ProviderElement<StationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StationRepository create(Ref ref) {
    return stationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StationRepository>(value),
    );
  }
}

String _$stationRepositoryHash() => r'ed5e8ab0ebd3421e55927f68450c5669887aa42a';

@ProviderFor(searchStationsUseCase)
final searchStationsUseCaseProvider = SearchStationsUseCaseProvider._();

final class SearchStationsUseCaseProvider
    extends
        $FunctionalProvider<
          SearchStationsUseCase,
          SearchStationsUseCase,
          SearchStationsUseCase
        >
    with $Provider<SearchStationsUseCase> {
  SearchStationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchStationsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchStationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchStationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchStationsUseCase create(Ref ref) {
    return searchStationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchStationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchStationsUseCase>(value),
    );
  }
}

String _$searchStationsUseCaseHash() =>
    r'b5ac312e0349cc747c8f0acb80ee8e449278fbd6';
