import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';

abstract class WorkoutRepo {
  Future<ApiResult<List<MusclesUpcomingEntity>>> getMuscelsUpcomingCategory();

  Future<ApiResult<List<MusclesUpcomingGroupEntity>>> getMusclesUpcomingGroup({required String groupId});
}