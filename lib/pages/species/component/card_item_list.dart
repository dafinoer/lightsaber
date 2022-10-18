import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lightsaber/component/routers.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../../presentation/species/species_store.dart';

class CardItemList extends StatelessWidget {
  const CardItemList(
      {Key? key, required this.index, required this.speciesStore})
      : super(key: key);

  final int index;
  final SpeciesStore speciesStore;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 600) {
      return Card(
        child: ListTile(
          leading: CircleAvatar(
              child: randomAvatar(index.toString(),
                  fit: BoxFit.cover, cacheColorFilter: true)),
          title: Text(speciesStore.species[index].name),
          subtitle: Text(speciesStore.species[index].classification),
          onTap: () => AutoRouter.of(context).push(
            DetailDevice(
              idSpecies: index + 1,
              idAvatar: index.toString(),
              name: speciesStore.species[index].name,
            ),
          ),
        ),
      );
    }

    return Card(
      child: ListTile(
        leading: CircleAvatar(
            child: randomAvatar(index.toString(),
                fit: BoxFit.cover, cacheColorFilter: true)),
        title: Text(speciesStore.species[index].name),
        subtitle: Text(speciesStore.species[index].classification),
        onTap: () => AutoRouter.of(context).navigate(
          DetailDesktop(
            idSpecies: index + 1,
            idAvatar: index.toString(),
            name: speciesStore.species[index].name,
          ),
        ),
      ),
    );
  }
}
