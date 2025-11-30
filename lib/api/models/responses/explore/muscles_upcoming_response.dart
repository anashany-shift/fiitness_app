import 'package:fitness_app/api/models/responses/explore/muscles_group_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscles_upcoming_response.g.dart';

@JsonSerializable()
class MusclesUpcomingResponse {
  final String message;

  @JsonKey(name: "musclesGroup")
  final List<MuscleGroupDto> musclesGroup;

  MusclesUpcomingResponse({
    required this.message,
    required this.musclesGroup,
  });

  factory MusclesUpcomingResponse.fromJson(Map<String, dynamic> json) =>
      _$MusclesUpcomingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesUpcomingResponseToJson(this);
}

