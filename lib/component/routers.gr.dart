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
    DetailDevice.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailDeviceArgs>(
          orElse: () => DetailDeviceArgs(
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
    DetailDesktop.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailDesktopArgs>(
          orElse: () => DetailDesktopArgs(
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
          children: [
            RouteConfig(
              DetailDesktop.name,
              path: 'detail-species/:id/:name/:idAvatar',
              parent: SpeciesScreenRoute.name,
            )
          ],
        ),
        RouteConfig(
          DetailDevice.name,
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
  const SpeciesScreenRoute({List<PageRouteInfo>? children})
      : super(
          SpeciesScreenRoute.name,
          path: '/species',
          initialChildren: children,
        );

  static const String name = 'SpeciesScreenRoute';
}

/// generated route for
/// [DetailScreenPage]
class DetailDevice extends PageRouteInfo<DetailDeviceArgs> {
  DetailDevice({
    Key? key,
    required int idSpecies,
    required String idAvatar,
    required String name,
  }) : super(
          DetailDevice.name,
          path: '/detail-species/:id/:name/:idAvatar',
          args: DetailDeviceArgs(
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

  static const String name = 'DetailDevice';
}

class DetailDeviceArgs {
  const DetailDeviceArgs({
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
    return 'DetailDeviceArgs{key: $key, idSpecies: $idSpecies, idAvatar: $idAvatar, name: $name}';
  }
}

/// generated route for
/// [DetailScreenPage]
class DetailDesktop extends PageRouteInfo<DetailDesktopArgs> {
  DetailDesktop({
    Key? key,
    required int idSpecies,
    required String idAvatar,
    required String name,
  }) : super(
          DetailDesktop.name,
          path: 'detail-species/:id/:name/:idAvatar',
          args: DetailDesktopArgs(
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

  static const String name = 'DetailDesktop';
}

class DetailDesktopArgs {
  const DetailDesktopArgs({
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
    return 'DetailDesktopArgs{key: $key, idSpecies: $idSpecies, idAvatar: $idAvatar, name: $name}';
  }
}
