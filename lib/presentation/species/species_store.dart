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
  Future<Group<Species>> fetchSpeciesRepository() async {
    final future = _speciesRepository.getAllSpecies(_indexNow.toString());
    _fetchSpecies = ObservableFuture(future);
    return future;
  }

  @action
  void onAddObservable(Group<Species> group) {
    _totalItem = group.count;
    if (group.result.isNotEmpty) {
      if (_isRefresh) {
        _observableList = ObservableList<Species>()..addAll(group.result);
        _isRefresh = false;
      } else {
        _observableList.addAll(group.result);
      }
    }
    _indexNow++;
    _isScrollEnd = false;
    _isFullLoad = !(species.length < _totalItem);
  }

  void checkNextContent() {
    if (fetchStatus != FutureStatus.pending && !_isFullLoad) {
      fetchSpeciesRepository();
    }
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
