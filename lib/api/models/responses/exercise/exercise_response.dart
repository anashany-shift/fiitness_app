import 'package:fitness_app/api/models/responses/exercise/exercise_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_response.g.dart';

@JsonSerializable()
class ExerciseResponse {
  final String message;
  final int totalExercises;
  final int totalPages;
  final int currentPage;
  final List<ExerciseDto> exercises;

  ExerciseResponse({
    required this.message,
    required this.totalExercises,
    required this.totalPages,
    required this.currentPage,
    required this.exercises,
  });

  factory ExerciseResponse.fromJson(Map<String, dynamic> json) =>
      _$ExerciseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseResponseToJson(this);
}
