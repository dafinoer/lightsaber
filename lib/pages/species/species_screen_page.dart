import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lightsaber/component/injector.dart';
import 'package:lightsaber/component/routers.dart';
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
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _speciesStore = SpeciesStore(getIt.get());
    _scrollController = ScrollController();
    _speciesStore.fetchSpeciesRepository();

    //Scroll listener for getting bottom position
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          _speciesStore.checkNextContent();
        }
      }
    });

    reaction((p0) => _speciesStore.fetchStatus, (p0) {
      if(_speciesStore.fetchStatus == FutureStatus.fulfilled) {
        final group = _speciesStore.fetchSpeciesValue;
        if (group != null) _speciesStore.onAddObservable(group);
      }
    });

    //scroll for pagination
    when((_) => _speciesStore.errorMessage != null, () {
      if (_speciesStore.errorMessage != null) {
        final snackBar = SnackBar(content: Text(_speciesStore.errorMessage!));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars'),
      ),
      body: SizedBox.expand(child: Observer(
        builder: (context) {
          if (_speciesStore.isFullLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () async {
              _speciesStore.onRefresh();
              await asyncWhen(
                  (p0) => _speciesStore.fetchStatus != FutureStatus.pending);
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _speciesStore.species.length + 1,
              itemBuilder: (context, index) {
                if (index == _speciesStore.species.length &&
                    !_speciesStore.isFullLoad) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: CircularProgressIndicator(),
                  ));
                } else if (index == _speciesStore.species.length) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          child: randomAvatar(index.toString(),
                              fit: BoxFit.cover, cacheColorFilter: true)),
                      title: Text(_speciesStore.species[index].name),
                      subtitle:
                          Text(_speciesStore.species[index].classification),
                      onTap: () => AutoRouter.of(context)
                          .push(DetailScreenRoute(idSpecies: index + 1)),
                    ),
                  ),
                );
              },
            ),
          );
        },
      )),
    );
  }
}
