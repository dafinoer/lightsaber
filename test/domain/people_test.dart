import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lightsaber/domain/models/people.dart';

void main() {
  test('Test comparing Object', () {
    final faker = Faker();
    const people1 = People('joko', 1, 1);
    const people2 = People('joko', 1, 1);
    final people4 = People(faker.person.name(), 0, 0);

    expect(identical(people1, people2), true);
    expect(identical(people1, people4), false);
    expect(people1 == people4, false);
  });
}
