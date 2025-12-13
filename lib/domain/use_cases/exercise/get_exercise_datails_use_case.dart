import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/exercise/exercise_entity.dart';
import 'package:fitness_app/domain/repo/exercise_repo/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExerciseDatailsUseCase {
  final ExerciseRepo exerciseRepo;

  GetExerciseDatailsUseCase(this.exerciseRepo);

  Future<ApiResult<List<ExerciseEntity>>> call({
    required String primeMoveId,
    required String levelId,
  }) {
    return exerciseRepo.getExerciseDetails(
      primeMoveId: primeMoveId,
      levelId: levelId,
    );
  }
}
