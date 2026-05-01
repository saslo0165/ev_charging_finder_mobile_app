import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import 'station_search_response.dart';

abstract class StationRepository {
  Future<Either<Failure, StationSearchResponse>> searchStations({
    required String query,
    String? city,
    int page = 1,
    int pageSize = 10,
  });
}
