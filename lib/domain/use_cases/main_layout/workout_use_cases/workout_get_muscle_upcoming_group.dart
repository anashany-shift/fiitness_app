import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/repo/main_layout/workout_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class WorkoutGetMuscleUpcomingGroupUseCase {
  final WorkoutRepo workoutRepo;

  WorkoutGetMuscleUpcomingGroupUseCase(this.workoutRepo);

  Future<ApiResult<List<MusclesUpcomingGroupEntity>>> call({required String groupId})async {
    return await workoutRepo.getMusclesUpcomingGroup( groupId: groupId);
  }
}