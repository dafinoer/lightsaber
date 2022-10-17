// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeciesStore on _SpeciesStore, Store {
  Computed<bool>? _$isLoadingScreenComputed;

  @override
  bool get isLoadingScreen =>
      (_$isLoadingScreenComputed ??= Computed<bool>(() => super.isLoadingScreen,
              name: '_SpeciesStore.isLoadingScreen'))
          .value;
  Computed<List<Species>>? _$speciesComputed;

  @override
  List<Species> get species =>
      (_$speciesComputed ??= Computed<List<Species>>(() => super.species,
              name: '_SpeciesStore.species'))
          .value;
  Computed<bool>? _$isFullLoadComputed;

  @override
  bool get isFullLoad =>
      (_$isFullLoadComputed ??= Computed<bool>(() => super.isFullLoad,
              name: '_SpeciesStore.isFullLoad'))
          .value;
  Computed<String?>? _$errorMessageComputed;

  @override
  String? get errorMessage =>
      (_$errorMessageComputed ??= Computed<String?>(() => super.errorMessage,
              name: '_SpeciesStore.errorMessage'))
          .value;

  late final _$_observableListAtom =
      Atom(name: '_SpeciesStore._observableList', context: context);

  @override
  ObservableList<Species> get _observableList {
    _$_observableListAtom.reportRead();
    return super._observableList;
  }

  @override
  set _observableList(ObservableList<Species> value) {
    _$_observableListAtom.reportWrite(value, super._observableList, () {
      super._observableList = value;
    });
  }

  late final _$_isFullLoadAtom =
      Atom(name: '_SpeciesStore._isFullLoad', context: context);

  @override
  bool get _isFullLoad {
    _$_isFullLoadAtom.reportRead();
    return super._isFullLoad;
  }

  @override
  set _isFullLoad(bool value) {
    _$_isFullLoadAtom.reportWrite(value, super._isFullLoad, () {
      super._isFullLoad = value;
    });
  }

  late final _$_isLoadingScreenAtom =
      Atom(name: '_SpeciesStore._isLoadingScreen', context: context);

  @override
  bool get _isLoadingScreen {
    _$_isLoadingScreenAtom.reportRead();
    return super._isLoadingScreen;
  }

  @override
  set _isLoadingScreen(bool value) {
    _$_isLoadingScreenAtom.reportWrite(value, super._isLoadingScreen, () {
      super._isLoadingScreen = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_SpeciesStore._errorMessage', context: context);

  @override
  String? get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$onFetchSpeciesAsyncAction =
      AsyncAction('_SpeciesStore.onFetchSpecies', context: context);

  @override
  Future<dynamic> onFetchSpecies() {
    return _$onFetchSpeciesAsyncAction.run(() => super.onFetchSpecies());
  }

  late final _$_SpeciesStoreActionController =
      ActionController(name: '_SpeciesStore', context: context);

  @override
  void onRefresh() {
    final _$actionInfo = _$_SpeciesStoreActionController.startAction(
        name: '_SpeciesStore.onRefresh');
    try {
      return super.onRefresh();
    } finally {
      _$_SpeciesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onError(String error) {
    final _$actionInfo = _$_SpeciesStoreActionController.startAction(
        name: '_SpeciesStore._onError');
    try {
      return super._onError(error);
    } finally {
      _$_SpeciesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingScreen: ${isLoadingScreen},
species: ${species},
isFullLoad: ${isFullLoad},
errorMessage: ${errorMessage}
    ''';
  }
}
