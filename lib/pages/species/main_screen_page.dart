import 'package:flutter/material.dart';
import 'package:lightsaber/pages/species/desktop_screen.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key, required this.item}) : super(key: key);
  final Widget item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < 600) return item;
        return DesktopScreen(listWidget: item);
      },
    );
  }
}
