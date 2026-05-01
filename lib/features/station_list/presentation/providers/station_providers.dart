import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/auth_providers.dart';
import '../../data/datasources/station_remote_datasource.dart';
import '../../data/repositories/station_repository_impl.dart';
import '../../domain/station_repository.dart';
import '../../domain/usecases/search_stations_usecase.dart';

part 'station_providers.g.dart';

@riverpod
StationRemoteDataSource stationRemoteDataSource(Ref ref) {
  return StationRemoteDataSourceImpl(ref.watch(dioProvider));
}

@riverpod
StationRepository stationRepository(Ref ref) {
  return StationRepositoryImpl(ref.watch(stationRemoteDataSourceProvider));
}

@riverpod
SearchStationsUseCase searchStationsUseCase(Ref ref) {
  return SearchStationsUseCase(ref.watch(stationRepositoryProvider));
}
