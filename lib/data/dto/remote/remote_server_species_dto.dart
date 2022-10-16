import 'package:json_annotation/json_annotation.dart';
import 'package:lightsaber/data/dto/remote/remote_server.dart';
import 'package:lightsaber/domain/models/group.dart';

import '../../../domain/models/species.dart';
import 'type_dto.dart';

part 'remote_server_species_dto.g.dart';

@JsonSerializable()
class RemoteServerSpeciesDto extends RemoteServer {
  @JsonKey(name: 'results')
  final List<TypeDto> types;

  RemoteServerSpeciesDto(
    super.prev,
    super.next,
    super.count,
    this.types,
  );

  factory RemoteServerSpeciesDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteServerSpeciesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServerSpeciesDtoToJson(this);

  Group<Species> toEntity() {
    final result = types.map((e) => e.toEntity()).toList(growable: false);
    return Group(count, result);
  }
}
