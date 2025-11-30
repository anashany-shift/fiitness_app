import 'package:fitness_app/api/models/responses/explore/muscles_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'random_muscles_response.g.dart';

@JsonSerializable()
class RandomMusclesResponse {
  final String message;
  final int totalMuscles;

    @JsonKey(name: "muscles")
  final List<MusclesDto> muscles;

  RandomMusclesResponse({
    required this.message,
    required this.totalMuscles,
    required this.muscles,
  });

  factory RandomMusclesResponse.fromJson(Map<String, dynamic> json) =>
      _$RandomMusclesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RandomMusclesResponseToJson(this);
}

