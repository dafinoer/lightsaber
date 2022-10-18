import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({Key? key, required this.listWidget}) : super(key: key);

  final Widget listWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: listWidget),
        Expanded(
          flex: 3,
          child: AutoRouter(placeholder: (context) => const Placeholder()),
        )
      ],
    );
  }
}
