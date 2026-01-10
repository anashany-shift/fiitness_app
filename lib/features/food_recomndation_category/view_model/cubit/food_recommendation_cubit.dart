import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/meals_entity/meals_by_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/use_cases/food_recomendation/get_meals_by_category_use_case.dart';
import 'package:fitness_app/domain/use_cases/food_recomendation/get_meals_categories_use_case.dart';
import 'package:fitness_app/features/food_recomndation_category/view_model/cubit/food_recommendation_event.dart';
import 'package:injectable/injectable.dart';

part 'food_recommendation_state.dart';

@injectable
class FoodRecommendationCubit extends Cubit<FoodRecommendationState> {
  final GetMealsByCategoryUseCase _getMealsByCategoryUseCase;
  final GetMealsCategoriesUseCase _getMealsCategoriesUseCase;
  FoodRecommendationCubit(
    this._getMealsByCategoryUseCase,
    this._getMealsCategoriesUseCase,
  ) : super(FoodRecommendationState());


  void doIntent(FoodRecommendationEvent event) {
    switch (event) {
      
      case GetAllFoodDataEvent():
        _getAllData(initialCategory: event.startWithCategory);
        break;
        
      case ChangeCategoryTabEvent(): 
        _changeTab(event.index, event.categoryName);
        break;
      case GetMealsCategoriesEvent():
        _getMealsCategories();
        break;
      case GetMealsByCategoryEvent():
       _getMealsByCategoriesName(categoryName: event.categoryName);
    }
  }
  Future<void> _getAllData({String? initialCategory}) async {
    final result = await _getMealsCategoriesUseCase.call();

    if (result is ApiSuccessResult<List<FoodCategoryEntity>>) {
      final categories = result.data;
      
      int initialIndex = 0;
      if (initialCategory != null) {
        initialIndex = categories.indexWhere((e) => e.name == initialCategory);
        if (initialIndex == -1) initialIndex = 0;
      }

      emit(state.copyWith(
        foodCategoryEntity: BaseState.success(categories),
        selectedTabIndex: initialIndex, 
      ));

      final categoryToFetch = categories[initialIndex].name ;
      if (categoryToFetch.isNotEmpty) {
         await _getMealsByCategoriesName(categoryName: categoryToFetch);
      }
      
    } else if (result is ApiErrorResult<List<FoodCategoryEntity>>) {
       emit(state.copyWith(foodCategoryEntity: BaseState.error(result.errorMessage)));
    }
  }

  Future<void> _changeTab(int index, String categoryName) async {
    emit(state.copyWith(selectedTabIndex: index));
    
    await _getMealsByCategoriesName(categoryName: categoryName);
  }

  Future<void> _getMealsCategories() async {
    emit(state.copyWith(foodCategoryEntity: BaseState(isLoading: true)));
    final result = await _getMealsCategoriesUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<FoodCategoryEntity>>():
        emit(
          state.copyWith(foodCategoryEntity: BaseState.success(result.data)),
        );

      case ApiErrorResult<List<FoodCategoryEntity>>():
        emit(
          state.copyWith(
            foodCategoryEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }

  Future<void> _getMealsByCategoriesName({required String categoryName}) async {
    emit(state.copyWith(mealsByCategoryEntity: BaseState(isLoading: true)));
    final result = await _getMealsByCategoryUseCase.call(
      categoryName: categoryName,
    );
    switch (result) {
      case ApiSuccessResult<List<MealsByCategoryEntity>>():
        emit(
          state.copyWith(mealsByCategoryEntity: BaseState.success(result.data)),
        );

      case ApiErrorResult<List<MealsByCategoryEntity>>():
        emit(
          state.copyWith(
            mealsByCategoryEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }
}
