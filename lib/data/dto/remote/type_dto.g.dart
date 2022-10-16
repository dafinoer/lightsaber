// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeDto _$TypeDtoFromJson(Map<String, dynamic> json) => TypeDto(
      json['name'] as String,
      json['classification'] as String,
      json['designation'] as String,
      json['height'] as String,
      json['skin_colors'] as String?,
      json['hair_colors'] as String?,
      json['eye_colors'] as String?,
      json['average_life_span'] as String?,
      const HomeWorldConverter().fromJson(json['homeworld'] as String?),
      (json['peoples'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TypeDtoToJson(TypeDto instance) => <String, dynamic>{
      'name': instance.name,
      'classification': instance.classification,
      'designation': instance.designation,
      'height': instance.height,
      'skin_colors': instance.skinColors,
      'hair_colors': instance.hairColors,
      'eye_colors': instance.eyeColors,
      'average_life_span': instance.averageLifeSpan,
      'homeworld': const HomeWorldConverter().toJson(instance.homeWorldId),
      'peoples': instance.peoples,
      'films': instance.films,
    };
