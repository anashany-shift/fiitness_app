import 'package:fitness_app/api/mapper/meals_mapper.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/safe_api_call.dart';
import 'package:fitness_app/data/data_source/food_recommendation/food_recommendation_data_source.dart';
import 'package:fitness_app/domain/entities/meals_entity/meals_by_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/repo/food_recommendation/food_recommendation_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRecommendationRepo)
class FoodRecommendationRepoImpl implements FoodRecommendationRepo {
  final FoodRecommendationDataSource foodRecommendationDataSource;

  FoodRecommendationRepoImpl(this.foodRecommendationDataSource);
  @override
  Future<ApiResult<List<FoodCategoryEntity>>> getFoodCategories() async {
    return safeApiCall(() async {
      final response = await foodRecommendationDataSource.getFoodCategories();
      return response;
    }, (response) => response.toEntity());
  }

  @override
  Future<ApiResult<List<MealsByCategoryEntity>>> getMealsByCategory({
    required String categoryName,
  }) async {
    return safeApiCall(() async {
      final response = await foodRecommendationDataSource.getMealsByCategory(
        categoryName: categoryName,
      );
      return response;
    }, (response) => response.toEntity());
  }
}
