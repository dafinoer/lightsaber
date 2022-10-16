import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/component/routers.dart';

void main() {
  test('Test compare Object', () {
    final appRoute = RouterApp.create();
    final appRoute2 = RouterApp.create();
    expect(identical(appRoute, appRoute2), true);
  });
}
