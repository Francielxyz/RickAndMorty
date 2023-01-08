import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/core/models/location_model.dart';
import 'package:rick_and_morty/core/models/origin_model.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
  });

  late final int id;
  late final String name;
  late final String status;
  late final String type;
  late final String gender;
  late final OriginModel origin;
  late final LocationModel location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final String created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  static List<CharacterModel> fromJsonList(List<dynamic> json) =>
      json.map((e) => _$CharacterModelFromJson(e)).toList();
}
