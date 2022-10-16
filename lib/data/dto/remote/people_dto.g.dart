// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleDto _$PeopleDtoFromJson(Map<String, dynamic> json) => PeopleDto(
      json['name'] as String,
      json['hair_color'] as String,
      json['height'] as String,
      json['mass'] as String,
      json['skin_color'] as String,
      json['eye_color'] as String,
      json['birth_year'] as String,
      const HomeWorldConverter().fromJson(json['homeworld'] as String?),
      $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.none,
      (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['species'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['vehicles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['starships'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PeopleDtoToJson(PeopleDto instance) => <String, dynamic>{
      'name': instance.name,
      'hair_color': instance.hairColor,
      'skin_color': instance.skinColor,
      'eye_color': instance.eyeColor,
      'birth_year': instance.birthYear,
      'height': instance.height,
      'mass': instance.mass,
      'homeworld': const HomeWorldConverter().toJson(instance.homeWorld),
      'gender': _$GenderEnumMap[instance.gender]!,
      'films': instance.films,
      'species': instance.species,
      'vehicles': instance.vehicles,
      'starships': instance.starships,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.none: 'n/a',
};
