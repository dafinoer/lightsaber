import 'package:lightsaber/component/injector.dart';
import 'package:lightsaber/data/data_source/remote/species_remote_data_source.dart';
import 'package:lightsaber/domain/models/species.dart';
import 'package:lightsaber/domain/repository/species_repository.dart';

import '../../domain/models/group.dart';

class SpeciesRepositoryImpl implements SpeciesRepository {
  final SpeciesRemoteDataSource remoteDataSource;

  const SpeciesRepositoryImpl(this.remoteDataSource);
  factory SpeciesRepositoryImpl.create() => SpeciesRepositoryImpl(getIt.get());

  @override
  Future<Group<Species>> getAllSpecies([String page = '1']) async {
    final result = await remoteDataSource.getGroupsOfPeople(page);
    final groups = result.toEntity();
    return groups;
  }

  @override
  Future<Species> getSpecies(String idSpecies) async {
    final result = await remoteDataSource.getSpecies(idSpecies);
    final species = result.toEntity();
    return species;
  }
}
