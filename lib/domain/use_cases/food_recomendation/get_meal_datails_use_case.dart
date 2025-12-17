import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_datails_entity.dart';
import 'package:fitness_app/domain/repo/food_recommendation/food_recommendation_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetMealDatailsUseCase {
  final FoodRecommendationRepo foodRecommendationRepo;

  GetMealDatailsUseCase(this.foodRecommendationRepo);


  Future<ApiResult<List<FoodDatailsEntity>>>call({required String mealId})async{
    return await foodRecommendationRepo.getMealDetails(mealId: mealId);
  }

}