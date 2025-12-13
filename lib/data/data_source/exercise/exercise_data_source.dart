import 'package:fitness_app/api/models/responses/exercise/difficulty_level_response.dart';
import 'package:fitness_app/api/models/responses/exercise/exercise_response.dart';

abstract class ExerciseDataSource {
  Future<DifficultyLevelsResponse>getDifficulty({required String primeMoveId});
  Future<ExerciseResponse>getExerciseDetails({required String primeMoveId,required String levelId});
}