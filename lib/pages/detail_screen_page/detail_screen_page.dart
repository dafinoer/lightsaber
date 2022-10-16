import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

class DetailScreenPage extends StatefulWidget {
  const DetailScreenPage({Key? key, @PathParam('id') required this.idSpecies})
      : super(key: key);

  final int idSpecies;

  @override
  State<DetailScreenPage> createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('lorem')),
    );
  }
}
