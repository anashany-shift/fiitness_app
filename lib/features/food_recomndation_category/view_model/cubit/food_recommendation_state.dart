part of 'food_recommendation_cubit.dart';

class FoodRecommendationState extends Equatable {
  final BaseState<List<FoodCategoryEntity>>? foodCategoryEntity;
  final BaseState<List<MealsByCategoryEntity>>? mealsByCategoryEntity;
  final int selectedTabIndex;

  const FoodRecommendationState({
    this.foodCategoryEntity,
    this.mealsByCategoryEntity,
    this.selectedTabIndex=0,
  });

  FoodRecommendationState copyWith({
    final BaseState<List<FoodCategoryEntity>>? foodCategoryEntity,
    final BaseState<List<MealsByCategoryEntity>>? mealsByCategoryEntity,
    final int? selectedTabIndex,
 } ) {
    return FoodRecommendationState(
      foodCategoryEntity: foodCategoryEntity ?? this.foodCategoryEntity,
      mealsByCategoryEntity:
          mealsByCategoryEntity ?? this.mealsByCategoryEntity,
          selectedTabIndex: selectedTabIndex??this.selectedTabIndex
    );
  }

  @override
  List<Object?> get props => [foodCategoryEntity, mealsByCategoryEntity,selectedTabIndex];
}
