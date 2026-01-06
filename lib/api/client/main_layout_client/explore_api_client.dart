import 'package:dio/dio.dart';

import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/api/models/responses/explore/random_muscles_response.dart';


import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';

part 'explore_api_client.g.dart';

@injectable
@RestApi()
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(@Named("mainApi")Dio dio) = _ExploreApiClient;

   //Random muscles
  @GET(ApiConstant.getMuscelsRandomForRecommendaion)
  Future<RandomMusclesResponse>getRandomMuscles ();


  //muscles group
  @GET(ApiConstant.muselsUpcoming)
  Future<MusclesUpcomingResponse>getMuscelsUpcoming ();


    @GET(ApiConstant.musclesUpcomingByGroupId)
  Future<MusclesUpcomingGroupResponse>getMusclesUpcomingGroup (@Path("groupId")String groupId);




   
 
}

