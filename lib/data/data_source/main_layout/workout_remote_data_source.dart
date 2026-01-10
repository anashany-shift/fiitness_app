import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';

abstract class WorkoutRemoteDataSource {
  Future<MusclesUpcomingResponse> getMuscelsUpcomingCategory();

  Future<MusclesUpcomingGroupResponse> getMusclesUpcomingGroup({required String groupId});
}