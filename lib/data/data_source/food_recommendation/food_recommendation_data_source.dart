import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_by_category_response.dart';

abstract class FoodRecommendationDataSource {
    Future<FoodCategoryResponse>getFoodCategories();
   Future<MealsByCategoryResponse>getMealsByCategory({required String categoryName});
   
}