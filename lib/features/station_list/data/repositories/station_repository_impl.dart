import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../domain/station_repository.dart';
import '../../domain/station_search_response.dart';
import '../datasources/station_remote_datasource.dart';

class StationRepositoryImpl implements StationRepository {
  final StationRemoteDataSource remoteDataSource;

  StationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, StationSearchResponse>> searchStations({
    required String query,
    String? city,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final model = await remoteDataSource.searchStations(
        query: query,
        city: city,
        page: page,
        pageSize: pageSize,
      );
      return Right(model.toDomain());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
