import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lightsaber/component/injector.dart';
import 'package:lightsaber/pages/detail_screen_page/component/list_item.dart';
import 'package:lightsaber/presentation/species_detail/species_detail_store.dart';
import 'package:mobx/mobx.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:sizer/sizer.dart';

class DetailScreenPage extends StatefulWidget {
  const DetailScreenPage({
    Key? key,
    @PathParam('id') required this.idSpecies,
    @PathParam('idAvatar') required this.idAvatar,
    @PathParam('name') required this.name,
  }) : super(key: key);

  final int idSpecies;
  final String idAvatar;
  final String name;

  @override
  State<DetailScreenPage> createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
  late final SpeciesDetailStore _speciesDetailStore;

  @override
  void initState() {
    super.initState();
    _speciesDetailStore = SpeciesDetailStore(getIt.get());
    _speciesDetailStore.fetchRepository('${widget.idSpecies}');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 35.h,
            flexibleSpace: FlexibleSpaceBar(
              background: randomAvatar(widget.idAvatar, trBackground: true),
              title: Text(widget.name, style: theme.appBarTheme.titleTextStyle),
            ),
          ),
          Observer(
            builder: (context) {
              switch (_speciesDetailStore.speciesFutureStatus) {
                case FutureStatus.pending:
                  return const SliverFillRemaining(
                      child: Center(
                          child: CircularProgressIndicator(
                    color: Color(0xffFCB600),
                  )));
                case FutureStatus.fulfilled:
                  if (_speciesDetailStore.speciesObject != null) {
                    return ListItem(
                        species: _speciesDetailStore.speciesObject!);
                  }
                  return const SliverFillRemaining(child: SizedBox.shrink());
                case FutureStatus.rejected:
                  return const SliverFillRemaining(
                      child: Center(child: Text('Someting Wrong')));
                default:
                  return const SliverFillRemaining(child: SizedBox.shrink());
              }
            },
          )
        ],
      ),
    );
  }
}
