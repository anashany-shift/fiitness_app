sealed class FoodRecommendationEvent {}

class GetMealsCategoriesEvent extends FoodRecommendationEvent {}
class GetAllFoodDataEvent extends FoodRecommendationEvent {
  final String? startWithCategory; 
  GetAllFoodDataEvent({this.startWithCategory});
}


class GetMealsByCategoryEvent extends FoodRecommendationEvent {
  final String categoryName;

  GetMealsByCategoryEvent({required this.categoryName});
}
class ChangeCategoryTabEvent extends FoodRecommendationEvent {
  final int index;
  final String categoryName;

  ChangeCategoryTabEvent({required this.index, required this.categoryName});
}
