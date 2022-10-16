import 'package:lightsaber/domain/models/group.dart';
import 'package:lightsaber/domain/models/people.dart';

abstract class PeopleRepository {
  Future<Group<People>> getGroupOfPeople([String pagination = '1']);

  Future<People> getPeople(String idPeople);
}
