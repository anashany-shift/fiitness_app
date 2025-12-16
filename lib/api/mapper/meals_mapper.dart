import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_by_category_response.dart';
import 'package:fitness_app/domain/entities/meals_entity/meals_by_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';

extension FoodCategoryResponseMapper on FoodCategoryResponse {
  List<FoodCategoryEntity> toEntity() {
    return  foodCategories.map((food) {
      return FoodCategoryEntity(
        id: food.id,
        name: food.name,
        thumbnail: food.thumbnail,
      );
    }).toList();
  }
}
extension MealsByCategoryResponseMapper on MealsByCategoryResponse{

  List<MealsByCategoryEntity> toEntity(){
    return mealsDto.map((meals) {
      return MealsByCategoryEntity(mealId: meals.id,mealImage:meals.thumbnail,mealTitle: meals.name );
    },).toList();
  }
}
