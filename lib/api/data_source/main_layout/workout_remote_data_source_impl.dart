import 'package:fitness_app/api/client/main_layout_client/workout_api_client.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/data/data_source/main_layout/workout_remote_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: WorkoutRemoteDataSource)
class WorkoutRemoteDataSourceImpl implements WorkoutRemoteDataSource{


final WorkoutApiClient _workoutApiClient;

  WorkoutRemoteDataSourceImpl(this._workoutApiClient);
@override
  Future<MusclesUpcomingResponse> getMuscelsUpcomingCategory()async {
    return await _workoutApiClient.getMuscelsUpcomingCategory();
  }
  @override
  Future<MusclesUpcomingGroupResponse> getMusclesUpcomingGroup({required String groupId}) async{
    return await _workoutApiClient.getMusclesUpcomingGroup(groupId);
  }
} 