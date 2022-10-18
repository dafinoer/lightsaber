import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:lightsaber/pages/species/species_screen_page.dart';

import '../pages/detail_screen_page/detail_screen_page.dart';
import '../pages/splash/splash_screen_page.dart';

part 'routers.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
        path: '/',
        page: SplashScreenPage,
        initial: true,
        guards: [SplashScreenGuard]),
    AutoRoute(path: '/species', page: SpeciesScreenPage, initial: true),
    AutoRoute(
        path: '/detail-species/:id/:name/:idAvatar', page: DetailScreenPage),
  ],
)
class RouterApp extends _$RouterApp {
  RouterApp._({required SplashScreenGuard splashScreenGuard})
      : super(splashScreenGuard: splashScreenGuard);

  static final RouterApp _routerApp =
      RouterApp._(splashScreenGuard: SplashScreenGuard());

  factory RouterApp.create() => _routerApp;
}

class SplashScreenGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
      resolver.next(true);
    } else {
      router.replace(const SpeciesScreenRoute());
    }
  }
}
