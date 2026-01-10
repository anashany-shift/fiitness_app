import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/random_muscle_entity.dart';

abstract class ExploreRepo {
  Future<ApiResult<List<RandomMuscleEntity>>>getRandomMuscles();
  Future<ApiResult<List<MusclesUpcomingEntity>>>getMusclesUpcoming();
  Future<ApiResult<List<MusclesUpcomingGroupEntity>>>getMusclesUpcomingGroup({required String groupId});
    Future<ApiResult<List<FoodCategoryEntity>>>getFoodCategories();
}