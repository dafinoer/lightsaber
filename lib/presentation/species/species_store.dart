import 'package:mobx/mobx.dart';

import '../../domain/models/species.dart';
import '../../domain/repository/species_repository.dart';

part 'species_store.g.dart';

class SpeciesStore = _SpeciesStore with _$SpeciesStore;

abstract class _SpeciesStore with Store {
  final SpeciesRepository _speciesRepository;

  @observable
  late ObservableList<Species> _observableList;

  @observable
  late bool _isFullLoad;

  int _indexNow = 1;

  @observable
  bool _isLoadingScreen = false;

  @observable
  String? _errorMessage;

  _SpeciesStore(this._speciesRepository) {
    _observableList = ObservableList<Species>();
    _isFullLoad = false;
  }

  @computed
  bool get isLoadingScreen => _isLoadingScreen;

  @computed
  List<Species> get species => _observableList;

  @computed
  bool get isFullLoad => _isFullLoad;

  @computed
  String? get errorMessage => _errorMessage;

  @action
  Future onFetchSpecies() async {
    _errorMessage = null;
    if (species.isEmpty) _isLoadingScreen = true;
    try {
      final species =
          await _speciesRepository.getAllSpecies(_indexNow.toString());
      if (species.result.isNotEmpty) _observableList.addAll(species.result);
      checkNextContent(species.count);
      _isLoadingScreen = false;
      _indexNow++;
    } catch (e) {
      _onError('oops something wrong');
    }
    return null;
  }

  void onPagination() {
    onFetchSpecies();
  }

  void checkNextContent(int countTotal) {
    final double progressPage = species.length / countTotal;
    _isFullLoad = !(progressPage < 1.0);
  }

  @action
  void onRefresh() {
    _isLoadingScreen = false;
    _isFullLoad = false;
    _indexNow = 1;
  }

  @action
  void _onError(String error) {
    _errorMessage = error;
  }
}
