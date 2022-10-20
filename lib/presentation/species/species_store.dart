import 'package:lightsaber/domain/models/group.dart';
import 'package:mobx/mobx.dart';

import '../../domain/models/species.dart';
import '../../domain/repository/species_repository.dart';

part 'species_store.g.dart';

class SpeciesStore = _SpeciesStore with _$SpeciesStore;

abstract class _SpeciesStore with Store {
  final SpeciesRepository _speciesRepository;

  int _indexNow = 1;

  int _totalItem = 0;

  bool _isFullLoad = false;

  Group<Species>? _groupOfSpecies;

  _SpeciesStore(this._speciesRepository);

  @observable
  late ObservableList<Species> _observableList = ObservableList<Species>();

  @observable
  ObservableFuture<Group<Species>?> _fetchSpecies =
      ObservableFuture.value(null);

  @observable
  bool _isScrollEnd = false;

  bool _isRefresh = false;

  @observable
  String? _errorMessage;

  bool get isFullLoad => _isFullLoad;

  @computed
  bool get isScrollEnd => _isScrollEnd;

  @computed
  List<Species> get species => _observableList;

  @computed
  String? get errorMessage => _errorMessage;

  @computed
  FutureStatus get fetchStatus => _fetchSpecies.status;

  @computed
  Group<Species>? get fetchSpeciesValue => _fetchSpecies.value;

  @computed
  bool get isFullLoading {
    return fetchStatus == FutureStatus.pending && species.isEmpty;
  }

  @action
  Future<void> fetchSpeciesRepository() async {
    _groupOfSpecies = null;
    final future = _speciesRepository.getAllSpecies(_indexNow.toString());
    _fetchSpecies = ObservableFuture(future);
    _groupOfSpecies = await future;
    return;
  }

  @action
  void onAddObservable() {
    final groupOfSpecies = _groupOfSpecies;
    if (groupOfSpecies != null && groupOfSpecies.result.isNotEmpty) {
      _totalItem = groupOfSpecies.count;
      if (_isRefresh) {
        _onNewInitializedObservableList(groupOfSpecies);
      } else {
        _observableList.addAll(groupOfSpecies.result);
      }
      _indexNow += 1;
    }
    _isRefresh = false;
    _isScrollEnd = false;
    _isFullLoad = !(species.length < _totalItem);
  }

  void checkNextContent() {
    if (fetchStatus != FutureStatus.pending && !_isFullLoad) {
      fetchSpeciesRepository();
    }
  }

  void _onNewInitializedObservableList(Group<Species> species) {
    _observableList = ObservableList<Species>()..addAll(species.result);
  }

  @action
  void onRefresh() {
    _isRefresh = true;
    _isFullLoad = false;
    _indexNow = 1;
    fetchSpeciesRepository();
  }

  @action
  void onError(String error) {
    _errorMessage = error;
  }
}
