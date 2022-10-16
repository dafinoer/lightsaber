import 'package:json_annotation/json_annotation.dart';
import 'package:lightsaber/data/dto/remote/people_dto.dart';
import 'package:lightsaber/domain/models/species.dart';

part 'type_dto.g.dart';

@JsonSerializable()
class TypeDto {
  final String name;
  final String classification;
  final String designation;
  final String height;

  final String? skinColors;
  final String? hairColors;
  final String? eyeColors;
  final String? averageLifeSpan;

  @JsonKey(name: 'homeworld')
  @HomeWorldConverter()
  final int? homeWorldId;

  final List<String>? peoples;
  final List<String>? films;

  TypeDto(
    this.name,
    this.classification,
    this.designation,
    this.height,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifeSpan,
    this.homeWorldId,
    this.peoples,
    this.films,
  );

  factory TypeDto.fromJson(Map<String, dynamic> json) =>
      _$TypeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TypeDtoToJson(this);

  Species toEntity() {
    String? homeWorld;
    if (homeWorldId != null) homeWorld = '$homeWorldId';
    return Species(
      name,
      int.tryParse(height) ?? 0,
      classification,
      homeWorldId: homeWorld,
    );
  }
}
