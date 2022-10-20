// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeciesStore on _SpeciesStore, Store {
  Computed<bool>? _$isScrollEndComputed;

  @override
  bool get isScrollEnd =>
      (_$isScrollEndComputed ??= Computed<bool>(() => super.isScrollEnd,
              name: '_SpeciesStore.isScrollEnd'))
          .value;
  Computed<List<Species>>? _$speciesComputed;

  @override
  List<Species> get species =>
      (_$speciesComputed ??= Computed<List<Species>>(() => super.species,
              name: '_SpeciesStore.species'))
          .value;
  Computed<String?>? _$errorMessageComputed;

  @override
  String? get errorMessage =>
      (_$errorMessageComputed ??= Computed<String?>(() => super.errorMessage,
              name: '_SpeciesStore.errorMessage'))
          .value;
  Computed<FutureStatus>? _$fetchStatusComputed;

  @override
  FutureStatus get fetchStatus =>
      (_$fetchStatusComputed ??= Computed<FutureStatus>(() => super.fetchStatus,
              name: '_SpeciesStore.fetchStatus'))
          .value;
  Computed<Group<Species>?>? _$fetchSpeciesValueComputed;

  @override
  Group<Species>? get fetchSpeciesValue => (_$fetchSpeciesValueComputed ??=
          Computed<Group<Species>?>(() => super.fetchSpeciesValue,
              name: '_SpeciesStore.fetchSpeciesValue'))
      .value;
  Computed<bool>? _$isFullLoadingComputed;

  @override
  bool get isFullLoading =>
      (_$isFullLoadingComputed ??= Computed<bool>(() => super.isFullLoading,
              name: '_SpeciesStore.isFullLoading'))
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

  late final _$_fetchSpeciesAtom =
      Atom(name: '_SpeciesStore._fetchSpecies', context: context);

  @override
  ObservableFuture<Group<Species>?> get _fetchSpecies {
    _$_fetchSpeciesAtom.reportRead();
    return super._fetchSpecies;
  }

  @override
  set _fetchSpecies(ObservableFuture<Group<Species>?> value) {
    _$_fetchSpeciesAtom.reportWrite(value, super._fetchSpecies, () {
      super._fetchSpecies = value;
    });
  }

  late final _$_isScrollEndAtom =
      Atom(name: '_SpeciesStore._isScrollEnd', context: context);

  @override
  bool get _isScrollEnd {
    _$_isScrollEndAtom.reportRead();
    return super._isScrollEnd;
  }

  @override
  set _isScrollEnd(bool value) {
    _$_isScrollEndAtom.reportWrite(value, super._isScrollEnd, () {
      super._isScrollEnd = value;
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

  late final _$fetchSpeciesRepositoryAsyncAction =
      AsyncAction('_SpeciesStore.fetchSpeciesRepository', context: context);

  @override
  Future<void> fetchSpeciesRepository() {
    return _$fetchSpeciesRepositoryAsyncAction
        .run(() => super.fetchSpeciesRepository());
  }

  late final _$_SpeciesStoreActionController =
      ActionController(name: '_SpeciesStore', context: context);

  @override
  void onAddObservable() {
    final _$actionInfo = _$_SpeciesStoreActionController.startAction(
        name: '_SpeciesStore.onAddObservable');
    try {
      return super.onAddObservable();
    } finally {
      _$_SpeciesStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void onError(String error) {
    final _$actionInfo = _$_SpeciesStoreActionController.startAction(
        name: '_SpeciesStore.onError');
    try {
      return super.onError(error);
    } finally {
      _$_SpeciesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isScrollEnd: ${isScrollEnd},
species: ${species},
errorMessage: ${errorMessage},
fetchStatus: ${fetchStatus},
fetchSpeciesValue: ${fetchSpeciesValue},
isFullLoading: ${isFullLoading}
    ''';
  }
}
