import 'package:lightsaber/component/injector.dart';
import 'package:lightsaber/data/data_source/remote/people_remote_data_source.dart';
import 'package:lightsaber/domain/models/group.dart';
import 'package:lightsaber/domain/models/people.dart';
import 'package:lightsaber/domain/repository/people_repository.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final PeopleRemoteDataSource remoteDataSource;

  PeopleRepositoryImpl(this.remoteDataSource);

  factory PeopleRepositoryImpl.create() => PeopleRepositoryImpl(getIt.get());

  @override
  Future<People> getPeople(String idPeople) async {
    final response = await remoteDataSource.getPeopleById(idPeople);
    final people = response.toEntity();
    return people;
  }

  @override
  Future<Group<People>> getGroupOfPeople([String pagination = '1']) async {
    final response = await remoteDataSource.getGroupOfPeople(pagination);
    final group = response.toEntity();
    throw group;
  }
}
