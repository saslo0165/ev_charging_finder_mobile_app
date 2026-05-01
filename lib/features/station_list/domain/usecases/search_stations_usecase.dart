import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../station_repository.dart';
import '../station_search_response.dart';

class SearchStationsParams {
  final String query;
  final String? city;
  final int page;
  final int pageSize;

  const SearchStationsParams({
    required this.query,
    this.city,
    this.page = 1,
    this.pageSize = 10,
  });
}

class SearchStationsUseCase {
  final StationRepository repository;

  SearchStationsUseCase(this.repository);

  Future<Either<Failure, StationSearchResponse>> call(SearchStationsParams params) async {
    return await repository.searchStations(
      query: params.query,
      city: params.city,
      page: params.page,
      pageSize: params.pageSize,
    );
  }
}
