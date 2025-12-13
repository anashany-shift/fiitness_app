import 'package:fitness_app/api/models/responses/exercise/levels_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'difficulty_level_response.g.dart';

@JsonSerializable()
class DifficultyLevelsResponse {
  final String message;
  final int totalLevels;

  @JsonKey(name: 'difficulty_levels')
  final List<LevelDto> difficultyLevels;

  DifficultyLevelsResponse({
    required this.message,
    required this.totalLevels,
    required this.difficultyLevels,
  });

  factory DifficultyLevelsResponse.fromJson(Map<String, dynamic> json) =>
      _$DifficultyLevelsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DifficultyLevelsResponseToJson(this);
}

