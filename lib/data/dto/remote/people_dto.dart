import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:lightsaber/domain/models/people.dart';
import 'package:lightsaber/extensions/strings_extension.dart';

part 'people_dto.g.dart';

enum Gender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('n/a')
  none,
}

@JsonSerializable()
class PeopleDto {
  final String name;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String height;
  final String mass;

  @JsonKey(name: 'homeworld')
  @HomeWorldConverter()
  final int? homeWorld;

  @JsonKey(defaultValue: Gender.none)
  final Gender gender;

  final List<String>? films;
  final List<String>? species;
  final List<String>? vehicles;
  final List<String>? starships;

  PeopleDto(
    this.name,
    this.hairColor,
    this.height,
    this.mass,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.homeWorld,
    this.gender,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
  );

  factory PeopleDto.fromJson(Map<String, dynamic> json) =>
      _$PeopleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleDtoToJson(this);

  Map<Gender, GenderType> get _gender => <Gender, GenderType>{
        Gender.male: GenderType.male,
        Gender.female: GenderType.female
      };

  People toEntity() {
    final height = int.tryParse(this.height) ?? 0;
    final mass = int.tryParse(this.mass) ?? 0;
    return People(name, height, mass,
        eyeColor: eyeColor != 'n/a' ? eyeColor : null,
        hairColor: hairColor != 'n/a' ? hairColor : null,
        skinColor: skinColor != 'n/a' ? skinColor : null,
        gender: _gender[gender] ?? GenderType.unknow);
  }
}

class HomeWorldConverter implements JsonConverter<int?, String?> {
  const HomeWorldConverter();

  @override
  String? toJson(int? object) {
    if (object != null) return '$object';
    return null;
  }

  @override
  int? fromJson(String? json) {
    if (json != null) {
      final uri = Uri.parse(json);
      return uri.idFromPathUrl();
    }
    return null;
  }
}
