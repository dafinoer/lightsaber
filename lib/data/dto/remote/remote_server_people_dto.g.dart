// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_server_people_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServerPeopleDto _$RemoteServerPeopleDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteServerPeopleDto(
      (json['results'] as List<dynamic>)
          .map((e) => PeopleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['prev'] as String?,
      json['next'] as String?,
      json['count'] as int,
    );

Map<String, dynamic> _$RemoteServerPeopleDtoToJson(
        RemoteServerPeopleDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'results': instance.types,
    };
