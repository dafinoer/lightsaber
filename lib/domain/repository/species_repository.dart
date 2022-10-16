import 'package:lightsaber/domain/models/group.dart';
import 'package:lightsaber/domain/models/species.dart';

abstract class SpeciesRepository {
  Future<Group<Species>> getAllSpecies([String page = '1']);

  Future<Species> getSpecies(String idSpecies);
}
