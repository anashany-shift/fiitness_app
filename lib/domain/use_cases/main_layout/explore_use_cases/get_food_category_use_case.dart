import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/repo/main_layout/explore_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFoodCategoryUseCase {
final ExploreRepo exploreRepo;

  GetFoodCategoryUseCase(this.exploreRepo);

  Future<ApiResult<List<FoodCategoryEntity>>> call() async {
  return await exploreRepo.getFoodCategories();
    
  }
}