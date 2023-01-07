import 'package:json_annotation/json_annotation.dart';

part 'origin_model.g.dart';

@JsonSerializable()
class OriginModel {
  OriginModel({
    required this.name,
    required this.url,
  });

  late final String name;
  late final String url;

  factory OriginModel.fromJson(Map<String, dynamic> json) =>
      _$OriginModelFromJson(json);

  Map<String, dynamic> toJson() => _$OriginModelToJson(this);
}
