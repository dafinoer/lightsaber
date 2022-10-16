import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/domain/models/species.dart';

void main() {
  test('Test comparing object', () {
    const Species species = Species('john Doe', 10, 'human');
    const Species species2 = Species('john Doe', 10, 'human');
    const species3 = Species('John', 10, 'human');

    expect(identical(species, species2), true);
    expect(species == species3, false);
  });
}
