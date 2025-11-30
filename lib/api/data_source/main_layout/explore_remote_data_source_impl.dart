import 'package:fitness_app/api/client/main_layout_client/explore_api_client.dart';
import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/api/models/responses/explore/random_muscles_response.dart';
import 'package:fitness_app/data/data_source/main_layout/explore_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final ExploreApiClient exploreApiClient;
  final FoodApiCLient foodApiCLient;

  ExploreRemoteDataSourceImpl(this.exploreApiClient, this.foodApiCLient);
  @override
  Future<RandomMusclesResponse> getRandomMuscles() async {
    return await exploreApiClient.getRandomMuscles();
  }

  @override
  Future<MusclesUpcomingResponse> getMusclesUpcoming() async {
    return await exploreApiClient.getMuscelsUpcoming();
  }

  @override
  Future<MusclesUpcomingGroupResponse> getMusclesUpcomingGroup({
    required String groupId,
  }) async {
    return await exploreApiClient.getMusclesUpcomingGroup(groupId);
  }
    @override
  Future<FoodCategoryResponse> getFoodCategories() async {
    return await foodApiCLient.getFoodCategories();
  }   
}
