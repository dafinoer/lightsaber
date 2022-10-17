import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:lightsaber/pages/species/species_screen_page.dart';

import '../pages/detail_screen_page/detail_screen_page.dart';
import '../pages/splash/splash_screen_page.dart';

part 'routers.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    //AutoRoute(path: '/', page: SplashScreenPage, initial: true),
    AutoRoute(path: '/species', page: SpeciesScreenPage, initial: true),
    AutoRoute(path: '/detail/:id', page: DetailScreenPage),
  ],
)
class RouterApp extends _$RouterApp {
  RouterApp._();

  static final RouterApp _routerApp = RouterApp._();

  factory RouterApp.create() => _routerApp;
}
