import 'package:json_annotation/json_annotation.dart';
part 'muscles_group_dto.g.dart';

@JsonSerializable()
class MuscleGroupDto {
  @JsonKey(name: "_id")
  final String id;

  final String name;

  MuscleGroupDto({
    required this.id,
    required this.name,
  });

  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleGroupDtoToJson(this);
}
