import 'package:get_it/get_it.dart';
import 'package:lightsaber/component/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:lightsaber/data/data_source/remote/people_remote_data_source.dart';
import 'package:lightsaber/data/repository/people_repository_impl.dart';

import '../data/data_source/remote/species_remote_data_source.dart';
import '../data/repository/species_repository_impl.dart';
import '../domain/repository/species_repository.dart';

final getIt = GetIt.instance;

class InjectorApp {
  static void onRegisterObject() {
    getIt.registerLazySingleton<AppConfig>(() => AppConfig.dev());
    getIt.registerSingleton<http.Client>(http.Client());
    getIt.registerFactory<PeopleRemoteDataSource>(
        () => PeopleRemoteDataSource.create());
    getIt.registerFactory<SpeciesRemoteDataSource>(
        () => SpeciesRemoteDataSource.create());
    getIt.registerFactory<PeopleRepositoryImpl>(
        () => PeopleRepositoryImpl.create());
    getIt.registerFactory<SpeciesRepository>(
        () => SpeciesRepositoryImpl.create());
  }
}
