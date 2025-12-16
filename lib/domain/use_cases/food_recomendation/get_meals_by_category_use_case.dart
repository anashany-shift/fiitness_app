import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/meals_entity/meals_by_category_entity.dart';
import 'package:fitness_app/domain/repo/food_recommendation/food_recommendation_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetMealsByCategoryUseCase {
  final FoodRecommendationRepo foodRecommendationRepo;

  GetMealsByCategoryUseCase(this.foodRecommendationRepo);

  Future<ApiResult<List<MealsByCategoryEntity>>>call({required String categoryName})async{

return await foodRecommendationRepo.getMealsByCategory(categoryName: categoryName);


  }

}