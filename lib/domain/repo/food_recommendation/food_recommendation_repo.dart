import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/meals_entity/meals_by_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';

abstract class FoodRecommendationRepo {

Future<ApiResult<List<FoodCategoryEntity>>>getFoodCategories();
Future<ApiResult<List<MealsByCategoryEntity>>>getMealsByCategory({required String categoryName});


}