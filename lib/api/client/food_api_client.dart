import 'package:dio/dio.dart';
import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_by_category_response.dart';
import 'package:fitness_app/api/models/responses/food_recommendation/meals_details_response.dart';
import 'package:fitness_app/core/constants/api_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'food_api_client.g.dart';

@injectable
@RestApi()
abstract class FoodApiCLient {
  @factoryMethod
  factory FoodApiCLient(@Named("secondaryApi") Dio dio) = _FoodApiCLient;

  @GET(ApiConstant.getFoodCategories)
  Future<FoodCategoryResponse> getFoodCategories();

  @GET(ApiConstant.mealsByCategory)
  Future<MealsByCategoryResponse> getMealsByCategory(
    @Query("c") String categoryName,
  );

  @GET(ApiConstant.mealsDetails)
  Future<MealsDetailsResponse> getMealDetails(@Query("i") String mealId);
}
