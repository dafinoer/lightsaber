import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(description, style: theme.textTheme.subtitle2),
          )
        ],
      ),
    );
  }
}
