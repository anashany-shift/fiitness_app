import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/api/models/responses/explore/random_muscles_response.dart';

abstract class ExploreRemoteDataSource {

  Future<RandomMusclesResponse>getRandomMuscles();
  Future<MusclesUpcomingResponse>getMusclesUpcoming();
  Future<MusclesUpcomingGroupResponse>getMusclesUpcomingGroup({required String groupId});
    Future<FoodCategoryResponse>getFoodCategories();
}