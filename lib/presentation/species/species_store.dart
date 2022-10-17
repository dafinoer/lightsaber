import 'package:mobx/mobx.dart';

import '../../domain/models/species.dart';
import '../../domain/repository/species_repository.dart';

part 'species_store.g.dart';

class SpeciesStore = _SpeciesStore with _$SpeciesStore;

abstract class _SpeciesStore with Store {
  final SpeciesRepository _speciesRepository;

  @observable
  late ObservableList<Species> _observableList = ObservableList<Species>();

  @observable
  late bool _isFullLoad = false;

  int _indexNow = 1;

  @observable
  bool _isLoadingScreen = false;

  @observable
  String? _errorMessage;

  _SpeciesStore(this._speciesRepository);

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
    try {
      _errorMessage = null;
      final groupSpecies =
          await _speciesRepository.getAllSpecies(_indexNow.toString());
      if (groupSpecies.result.isNotEmpty) {
        _observableList.addAll(groupSpecies.result);
      }
      checkNextContent(groupSpecies.count);
      _isLoadingScreen = false;
      _indexNow++;
    } catch (e) {
      _onError('oops something wrong');
    }
    return null;
  }

  void onPagination() {
    if (!isFullLoad && !_isLoadingScreen) {
      _isLoadingScreen = true;
      onFetchSpecies();
    }
  }

  void checkNextContent(int countTotal) {
    if (species.length < countTotal) {
      final double progressPage = species.length / countTotal;
      _isFullLoad = !(progressPage < 1.0);
    } else {
      _isFullLoad = true;
    }
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
