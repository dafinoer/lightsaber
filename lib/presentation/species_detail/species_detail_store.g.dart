// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SpeciesDetailStore on _SpeciesDetailStore, Store {
  Computed<FutureStatus?>? _$speciesFutureStatusComputed;

  @override
  FutureStatus? get speciesFutureStatus => (_$speciesFutureStatusComputed ??=
          Computed<FutureStatus?>(() => super.speciesFutureStatus,
              name: '_SpeciesDetailStore.speciesFutureStatus'))
      .value;
  Computed<Species?>? _$speciesObjectComputed;

  @override
  Species? get speciesObject =>
      (_$speciesObjectComputed ??= Computed<Species?>(() => super.speciesObject,
              name: '_SpeciesDetailStore.speciesObject'))
          .value;

  late final _$observableSpeciesFutureAtom = Atom(
      name: '_SpeciesDetailStore.observableSpeciesFuture', context: context);

  @override
  ObservableFuture<Species>? get observableSpeciesFuture {
    _$observableSpeciesFutureAtom.reportRead();
    return super.observableSpeciesFuture;
  }

  @override
  set observableSpeciesFuture(ObservableFuture<Species>? value) {
    _$observableSpeciesFutureAtom
        .reportWrite(value, super.observableSpeciesFuture, () {
      super.observableSpeciesFuture = value;
    });
  }

  late final _$_SpeciesDetailStoreActionController =
      ActionController(name: '_SpeciesDetailStore', context: context);

  @override
  Future<Species> fetchRepository(String id) {
    final _$actionInfo = _$_SpeciesDetailStoreActionController.startAction(
        name: '_SpeciesDetailStore.fetchRepository');
    try {
      return super.fetchRepository(id);
    } finally {
      _$_SpeciesDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableSpeciesFuture: ${observableSpeciesFuture},
speciesFutureStatus: ${speciesFutureStatus},
speciesObject: ${speciesObject}
    ''';
  }
}
