import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/repo/main_layout/workout_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class WorkoutGetMuscleUpcomingCategoryUseCase {
  final WorkoutRepo workoutRepo;

  WorkoutGetMuscleUpcomingCategoryUseCase(this.workoutRepo);

  Future<ApiResult<List<MusclesUpcomingEntity>>> call()async {
    return await workoutRepo.getMuscelsUpcomingCategory();
  }
}