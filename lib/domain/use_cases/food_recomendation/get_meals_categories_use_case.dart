import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/repo/food_recommendation/food_recommendation_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMealsCategoriesUseCase {
  final FoodRecommendationRepo foodRecommendationRepo;

  GetMealsCategoriesUseCase(this.foodRecommendationRepo);
  Future<ApiResult<List<FoodCategoryEntity>>> call() async {
    return await foodRecommendationRepo.getFoodCategories();
  }
}
