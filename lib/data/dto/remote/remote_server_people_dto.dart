import 'package:json_annotation/json_annotation.dart';
import 'package:lightsaber/data/dto/remote/people_dto.dart';
import 'package:lightsaber/data/dto/remote/remote_server.dart';

import '../../../domain/models/group.dart';
import '../../../domain/models/people.dart';

part 'remote_server_people_dto.g.dart';

@JsonSerializable()
class RemoteServerPeopleDto extends RemoteServer {
  @JsonKey(name: 'results')
  final List<PeopleDto> types;

  RemoteServerPeopleDto(
    this.types,
    super.prev,
    super.next,
    super.count,
  );

  factory RemoteServerPeopleDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteServerPeopleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServerPeopleDtoToJson(this);

  Group<People> toEntity() {
    final peoples = types.map((e) => e.toEntity()).toList(growable: false);
    return Group(count, peoples);
  }
}
