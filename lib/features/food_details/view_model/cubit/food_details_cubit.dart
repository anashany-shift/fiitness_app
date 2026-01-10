import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_datails_entity.dart';
import 'package:fitness_app/domain/use_cases/food_recomendation/get_meal_datails_use_case.dart';
import 'package:fitness_app/features/food_details/view_model/cubit/food_details_event.dart';
import 'package:injectable/injectable.dart';

part 'food_details_state.dart';

@injectable
class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  final GetMealDatailsUseCase _getMealDatailsUseCase;
  FoodDetailsCubit(this._getMealDatailsUseCase) : super(FoodDetailsState());

  void doIntent(FoodDetailsEvent event) {
    switch (event) {
      case GetMealDetailsEvent():
        _getMealDetails(mealId: event.mealId);
    }
  }

  Future<void> _getMealDetails({required String mealId}) async {
    emit(state.copyWith(foodDatailsEntity: BaseState(isLoading: true)));

    final result = await _getMealDatailsUseCase.call(mealId: mealId);

    switch (result) {
      case ApiSuccessResult<List<FoodDatailsEntity>>():
        emit(state.copyWith(foodDatailsEntity: BaseState.success(result.data)));

      case ApiErrorResult<List<FoodDatailsEntity>>():
        emit(
          state.copyWith(
            foodDatailsEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }
}
