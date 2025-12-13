import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/exercise/difficulty_levels_entity.dart';
import 'package:fitness_app/domain/repo/exercise_repo/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDifficultyLevelUseCase {
  final ExerciseRepo exerciseRepo;

  GetDifficultyLevelUseCase(this.exerciseRepo);

  Future<ApiResult<List<DifficultyLevelsEntity>>> call({
    required String primeMoveId,
  }) async {
    return await exerciseRepo.getDifficultyLevel(primeMoveId: primeMoveId);
  }
}
