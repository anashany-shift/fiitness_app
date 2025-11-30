import 'package:json_annotation/json_annotation.dart';
part 'muscles_dto.g.dart';
@JsonSerializable()
class MusclesDto {
  @JsonKey(name: "_id")
  final String id;

  final String name;
  final String? image;

  MusclesDto({
    required this.id,
    required this.name,
    this.image,
  });

  factory MusclesDto.fromJson(Map<String, dynamic> json) =>
      _$MusclesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesDtoToJson(this);
}
