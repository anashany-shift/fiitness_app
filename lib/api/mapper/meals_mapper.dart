import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_by_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_details_response.dart';
import 'package:fitness_app/domain/entities/meals_entity/meals_by_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_datails_entity.dart';

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
extension MealsDetailsResponseMapper on MealsDetailsResponse{

  List<FoodDatailsEntity> toEntity(){
    return meals?.map((meals) {
      return FoodDatailsEntity(
        desc: meals.instructions,
        id: meals.idMeal,
        imageCover: meals.mealImage,
        videoLink: meals.youtubeLink,
        title: meals.category,
        ingerdiant1: meals.ingredient1,
        ingerdiant2: meals.ingredient2,
        ingerdiant3: meals.ingredient3,
        ingerdiant4: meals.ingredient4,
        ingerdiant5: meals.ingredient5,
        ingerdiant6: meals.ingredient6,
        ingerdiant7: meals.ingredient7,
        ingerdiant8: meals.ingredient8,
        ingerdiant9: meals.ingredient9,
        ingerdiant10: meals.ingredient10,
        ingerdiant11: meals.ingredient11,
        ingerdiant12: meals.ingredient12,
        measurment1: meals.measure1,
        measurment2: meals.measure2,
        measurment3: meals.measure3,
        measurment4: meals.measure4,
        measurment5: meals.measure5,
        measurment6: meals.measure6,
        measurment7: meals.measure7,
        measurment8: meals.measure8,
        measurment9: meals.measure9,
        measurment10: meals.measure10,
        measurment11: meals.measure11,
        measurment12: meals.measure12,
      );
    },).toList()??[];
  }
}
