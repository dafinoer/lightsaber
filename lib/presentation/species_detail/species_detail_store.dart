import 'package:lightsaber/domain/repository/species_repository.dart';
import 'package:mobx/mobx.dart';

import '../../domain/models/species.dart';

part 'species_detail_store.g.dart';

class SpeciesDetailStore = _SpeciesDetailStore with _$SpeciesDetailStore;

abstract class _SpeciesDetailStore with Store {
  final SpeciesRepository speciesRepository;

  String? _idSpecies;

  _SpeciesDetailStore(this.speciesRepository);

  @observable
  ObservableFuture<Species>? observableSpeciesFuture;

  @computed
  FutureStatus? get speciesFutureStatus => observableSpeciesFuture?.status;

  @computed
  Species? get speciesObject => observableSpeciesFuture?.value;

  @action
  Future<Species> fetchRepository(String id) {
    _idSpecies = id;
    final future = speciesRepository.getSpecies(id);
    observableSpeciesFuture = ObservableFuture(future);
    return future;
  }

  void onRefresh() {
    final idSpecies = _idSpecies;
    if (idSpecies != null) fetchRepository(idSpecies);
  }
}
