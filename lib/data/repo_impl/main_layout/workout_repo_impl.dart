import 'package:fitness_app/api/mapper/main_layout/explore_mapper.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/safe_api_call.dart';
import 'package:fitness_app/data/data_source/main_layout/workout_remote_data_source.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/repo/main_layout/workout_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:WorkoutRepo)
class WorkoutRepoImpl implements WorkoutRepo{
  final WorkoutRemoteDataSource _workoutRemoteDataSource;
  WorkoutRepoImpl(this._workoutRemoteDataSource);
  @override 
    
  Future<ApiResult<List<MusclesUpcomingEntity>>> getMuscelsUpcomingCategory() async{
     return safeApiCall<MusclesUpcomingResponse,List<MusclesUpcomingEntity>>(() async{
     final response= await _workoutRemoteDataSource.getMuscelsUpcomingCategory();
     return response;
    }, (response) =>response.toEntity());
  }
  @override
  Future<ApiResult<List<MusclesUpcomingGroupEntity>>> getMusclesUpcomingGroup({required String groupId})async {
    return safeApiCall(()async {
    final response=await _workoutRemoteDataSource.getMusclesUpcomingGroup(groupId: groupId);
    return response;
     
   }, (response) =>response.toEntity() ,);
  }
}