import 'package:fitness_app/api/models/responses/explore/muscles_dto.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_group_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_upcoming_group_response.g.dart';

@JsonSerializable()
class MusclesUpcomingGroupResponse {
  final String message;

  @JsonKey(name: "muscleGroup")
  final MuscleGroupDto muscleGroup;

  @JsonKey(name: "muscles")

  final List<MusclesDto> muscles;

  MusclesUpcomingGroupResponse({
    required this.message,
    required this.muscleGroup,
    required this.muscles,
  });

  factory MusclesUpcomingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$MusclesUpcomingGroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesUpcomingGroupResponseToJson(this);
}


