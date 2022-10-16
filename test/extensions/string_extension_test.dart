import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/extensions/strings_extension.dart';

void main() {
  test('Test string extension', () {
    final uri = Uri.parse('https://swapi.dev/api/planets/1/');
    final url2 = Uri.parse('https://swapi.dev/api/planets/');
    expect(uri.idFromPathUrl(), 1);
    expect(url2.idFromPathUrl(), null);
  });
}
