import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/station_search_response.dart';
import '../../domain/usecases/search_stations_usecase.dart';
import 'station_providers.dart';

part 'station_search_notifier.g.dart';

@riverpod
class StationSearchNotifier extends _$StationSearchNotifier {
  @override
  AsyncValue<StationSearchResponse?> build() {
    return const AsyncData(null);
  }

  Future<void> search(String query, {String? city, int page = 1}) async {
    state = const AsyncLoading();
    
    final useCase = ref.read(searchStationsUseCaseProvider);
    final result = await useCase(SearchStationsParams(
      query: query,
      city: city,
      page: page,
    ));

    if (!ref.mounted) return;

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (response) => AsyncData(response),
    );
  }
}
