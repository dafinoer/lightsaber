import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lightsaber/component/routers.dart';
import 'package:sizer/sizer.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10000)).then((value) {
      AutoRouter.of(context).replace(const SpeciesScreenRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(180.0)),
                    child: ColoredBox(
                      color: const Color(0xFFFCB600),
                      child: SizedBox.square(dimension: 20.h),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(size: 7.h),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                  Text('May the 4th be with you',
                      style: theme.textTheme.headline5
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                  const CircularProgressIndicator(color: Color(0xFFFCB600),)
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(360.0)),
                      child: ColoredBox(
                        color: const Color(0xFFFCB600),
                        child: SizedBox.square(dimension: 30.h),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
