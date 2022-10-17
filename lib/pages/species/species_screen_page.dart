import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lightsaber/component/injector.dart';
import 'package:lightsaber/presentation/species/species_store.dart';
import 'package:mobx/mobx.dart';
import 'package:random_avatar/random_avatar.dart';

class SpeciesScreenPage extends StatefulWidget {
  const SpeciesScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SpeciesScreenPage> createState() => _SpeciesScreenPageState();
}

class _SpeciesScreenPageState extends State<SpeciesScreenPage> {
  late final SpeciesStore _speciesStore;

  @override
  void initState() {
    super.initState();
    _speciesStore = SpeciesStore(getIt.get());
    _speciesStore.onFetchSpecies();
    when((_) => _speciesStore.errorMessage != null, () {
      if (_speciesStore.errorMessage != null) {
        final snackBar = SnackBar(content: Text(_speciesStore.errorMessage!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(child: Observer(
        builder: (context) {
          if (_speciesStore.isLoadingScreen) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: _speciesStore.species.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: randomAvatar('saytoonz', fit: BoxFit.cover),
              ),
              title: Text(_speciesStore.species[index].name),
            ),
          );
        },
      )),
    );
  }
}
