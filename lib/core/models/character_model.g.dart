// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: OriginModel.fromJson(json['origin'] as Map<String, dynamic>),
      locationModel:
          LocationModel.fromJson(json['locationModel'] as Map<String, dynamic>),
      image: json['imaage'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
    )..created = json['created'] as String;

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'locationModel': instance.locationModel,
      'imaage': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };
