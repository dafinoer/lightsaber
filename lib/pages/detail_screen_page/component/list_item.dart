import 'package:flutter/material.dart';
import 'package:lightsaber/domain/models/species.dart';
import 'package:lightsaber/pages/detail_screen_page/component/item_widget.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.species}) : super(key: key);
  final Species species;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        if (species.eyeColors != null)
          CardItemWidget(title: 'Eye Colors', description: species.eyeColors!),
        if (species.skinColors != null)
          CardItemWidget(title: 'Skin Color', description: species.skinColors!),
        if (species.hairColors != null)
          CardItemWidget(
              title: 'Hair Colors', description: species.hairColors!),
      ]),
    );
  }
}
