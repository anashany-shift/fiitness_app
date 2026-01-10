import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/exercise/difficulty_levels_entity.dart';
import 'package:fitness_app/domain/entities/responses/exercise/exercise_entity.dart';

abstract class ExerciseRepo {
  Future<ApiResult<List<DifficultyLevelsEntity>>> getDifficultyLevel({
    required String primeMoveId,
  });
  Future<ApiResult<List<ExerciseEntity>>> getExerciseDetails({
    required String primeMoveId,
    required String levelId,
  });
}
