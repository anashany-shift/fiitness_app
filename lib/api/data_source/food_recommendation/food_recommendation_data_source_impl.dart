import 'package:fitness_app/api/client/food_api_client.dart';
import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_by_category_response.dart';
import 'package:fitness_app/data/data_source/food_recommendation/food_recommendation_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRecommendationDataSource)
class FoodRecommendationDataSourceImpl implements FoodRecommendationDataSource {
  final FoodApiCLient foodApiCLient;

  FoodRecommendationDataSourceImpl(this.foodApiCLient);
  @override
  Future<FoodCategoryResponse> getFoodCategories() async {
    return await foodApiCLient.getFoodCategories();
  }

  @override
  Future<MealsByCategoryResponse> getMealsByCategory({
    required String categoryName,
  }) async {
    return await foodApiCLient.getMealsByCategory(categoryName);
  }
}
