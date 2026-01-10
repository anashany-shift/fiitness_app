
import 'package:fitness_app/api/models/responses/exercise/difficulty_level_response.dart';
import 'package:fitness_app/api/models/responses/exercise/exercise_response.dart';
import 'package:fitness_app/domain/entities/responses/exercise/difficulty_levels_entity.dart';
import 'package:fitness_app/domain/entities/responses/exercise/exercise_entity.dart';

extension DifficultyLevelResponseMapper on DifficultyLevelsResponse {
  List<DifficultyLevelsEntity> toEntity() {
    return difficultyLevels.map((levels) {
      return DifficultyLevelsEntity(id: levels.id, name: levels.name);
    }).toList();
  }
}

extension ExerciseResponseMapper on ExerciseResponse {
  List<ExerciseEntity> toEntity() {
    return exercises.map((exercise) {
      return ExerciseEntity(
        exerciseId: exercise.id,
        exerciseName: exercise.exerciseName,
        primeMoverMuscle: exercise.primeMoverMuscle ?? "",
        youtubeLink: exercise.shortYoutubeDemonstrationLink ?? "",
        muscleGroup: exercise.targetMuscleGroup
      );
    }).toList();
  }
}
