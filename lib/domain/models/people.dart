import 'dart:collection';

enum GenderType { male, female, unknow }

class People {
  final String name;
  final int height;
  final int mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final GenderType? gender;
  final UnmodifiableListView<String>? filmIds;

  const People(
    this.name,
    this.height,
    this.mass, {
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.gender,
    this.filmIds,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is People &&
        other.name == name &&
        other.height == height &&
        other.mass == mass &&
        other.gender == gender;
  }

  @override
  int get hashCode => Object.hashAll([name, height, mass, gender]);
}
