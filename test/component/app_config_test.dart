import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/component/app_config.dart';

void main() {
  test('Test Compare AppConfig', () {
    final dev1 = AppConfig.dev();
    final dev2 = AppConfig.dev();
    expect(identical(dev1, dev2), true);
    expect(dev1 == dev2, true);
  });
}
