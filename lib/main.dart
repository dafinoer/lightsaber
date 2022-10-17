import 'package:flutter/material.dart';
import 'package:lightsaber/component/app_theme.dart';
import 'package:lightsaber/component/injector.dart';
import 'package:sizer/sizer.dart';

import 'component/routers.dart';

void main() {
  InjectorApp.onRegisterObject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRoute = RouterApp.create();
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        title: 'LightSaber Demo',
        theme: AppTheme.light,
        routerDelegate: appRoute.delegate(),
        routeInformationParser: appRoute.defaultRouteParser(),
      ),
    );
  }
}
