import 'package:dio/dio.dart';

import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';


import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';

part 'workout_api_client.g.dart';

@injectable
@RestApi()
abstract class WorkoutApiClient {
  @factoryMethod
  factory WorkoutApiClient(@Named("mainApi")Dio dio) = _WorkoutApiClient;

  //muscles group
  @GET(ApiConstant.muselsUpcoming)
  Future<MusclesUpcomingResponse>getMuscelsUpcomingCategory ();


    @GET(ApiConstant.musclesUpcomingByGroupId)
  Future<MusclesUpcomingGroupResponse>getMusclesUpcomingGroup (@Path("groupId")String groupId);




   
 
}


