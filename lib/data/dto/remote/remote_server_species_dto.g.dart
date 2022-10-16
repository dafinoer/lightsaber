// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_server_species_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServerSpeciesDto _$RemoteServerSpeciesDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteServerSpeciesDto(
      json['prev'] as String?,
      json['next'] as String?,
      json['count'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => TypeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteServerSpeciesDtoToJson(
        RemoteServerSpeciesDto instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'prev': instance.prev,
      'results': instance.types,
    };
