// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routers.dart';

class _$RouterApp extends RootStackRouter {
  _$RouterApp([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SpeciesScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SpeciesScreenPage(),
      );
    },
    DetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailScreenRouteArgs>(
          orElse: () =>
              DetailScreenRouteArgs(idSpecies: pathParams.getInt('id')));
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DetailScreenPage(
          key: args.key,
          idSpecies: args.idSpecies,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/species',
          fullMatch: true,
        ),
        RouteConfig(
          SpeciesScreenRoute.name,
          path: '/species',
        ),
        RouteConfig(
          DetailScreenRoute.name,
          path: '/detail/:id',
        ),
      ];
}

/// generated route for
/// [SpeciesScreenPage]
class SpeciesScreenRoute extends PageRouteInfo<void> {
  const SpeciesScreenRoute()
      : super(
          SpeciesScreenRoute.name,
          path: '/species',
        );

  static const String name = 'SpeciesScreenRoute';
}

/// generated route for
/// [DetailScreenPage]
class DetailScreenRoute extends PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    Key? key,
    required int idSpecies,
  }) : super(
          DetailScreenRoute.name,
          path: '/detail/:id',
          args: DetailScreenRouteArgs(
            key: key,
            idSpecies: idSpecies,
          ),
          rawPathParams: {'id': idSpecies},
        );

  static const String name = 'DetailScreenRoute';
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.idSpecies,
  });

  final Key? key;

  final int idSpecies;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, idSpecies: $idSpecies}';
  }
}
