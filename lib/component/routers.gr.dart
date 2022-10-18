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
  _$RouterApp({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.splashScreenGuard,
  }) : super(navigatorKey);

  final SplashScreenGuard splashScreenGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashScreenPage(),
      );
    },
    SpeciesScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SpeciesScreenPage(),
      );
    },
    DetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailScreenRouteArgs>(
          orElse: () => DetailScreenRouteArgs(
                idSpecies: pathParams.getInt('id'),
                idAvatar: pathParams.getString('idAvatar'),
                name: pathParams.getString('name'),
              ));
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DetailScreenPage(
          key: args.key,
          idSpecies: args.idSpecies,
          idAvatar: args.idAvatar,
          name: args.name,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashScreenRoute.name,
          path: '/',
          guards: [splashScreenGuard],
        ),
        RouteConfig(
          SpeciesScreenRoute.name,
          path: '/species',
        ),
        RouteConfig(
          DetailScreenRoute.name,
          path: '/detail-species/:id/:name/:idAvatar',
        ),
      ];
}

/// generated route for
/// [SplashScreenPage]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
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
    required String idAvatar,
    required String name,
  }) : super(
          DetailScreenRoute.name,
          path: '/detail-species/:id/:name/:idAvatar',
          args: DetailScreenRouteArgs(
            key: key,
            idSpecies: idSpecies,
            idAvatar: idAvatar,
            name: name,
          ),
          rawPathParams: {
            'id': idSpecies,
            'idAvatar': idAvatar,
            'name': name,
          },
        );

  static const String name = 'DetailScreenRoute';
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.idSpecies,
    required this.idAvatar,
    required this.name,
  });

  final Key? key;

  final int idSpecies;

  final String idAvatar;

  final String name;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, idSpecies: $idSpecies, idAvatar: $idAvatar, name: $name}';
  }
}
