import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/random_muscle_entity.dart';
import 'package:fitness_app/domain/use_cases/main_layout/explore_use_cases/get_food_category_use_case.dart';
import 'package:fitness_app/domain/use_cases/main_layout/explore_use_cases/get_muscles_upcoming_by_group_id.dart';
import 'package:fitness_app/domain/use_cases/main_layout/explore_use_cases/get_muscles_upcoming_use_case.dart';
import 'package:fitness_app/domain/use_cases/main_layout/explore_use_cases/get_random_muscles_use_case.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit_event.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_state.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final GetRandomMusclesUseCase _getRandomMusclesUseCase;
  final GetMusclesUpcomingUseCase _getMusclesUpcomingUseCase;
  final GetMusclesUpcomingByGroupId _getMusclesUpcomingByGroupIdUseCases;
  final GetFoodCategoryUseCase _getFoodCategoryUseCase;

  ExploreCubit(
    this._getRandomMusclesUseCase,
    this._getMusclesUpcomingUseCase,
    this._getMusclesUpcomingByGroupIdUseCases,
    this._getFoodCategoryUseCase,
  ) : super(ExploreState());
  void doIntent(ExploreCubitEvent event) {
    switch (event) {
      case ExploreGetAllData():
        _getAllData();
        return;

      case ExploreMuscleGroupEvent():
        _getMusclesUpcomingGroup(groupId: event.groupId ?? "");
        return;

      case ExploreGetRandomMuscle():
        _getRandomMuscles();
        return;

      case ExploreGetMuscleUpcoming():
        _getMusclesUpcoming();
        return;

      case ExploreGetFoodCategories():
        _getFoodCategory();
        return;
    }
  }

  Future<void> _getAllData() async {
    await _getMusclesUpcoming();

    final groupId = state.musclesUpcomingEntity?.data?.first.id;

    if (groupId != null && groupId.isNotEmpty) {
      await _getMusclesUpcomingGroup(groupId: groupId);
    }

    _getRandomMuscles();
    _getFoodCategory();
  }

  Future<void> _getRandomMuscles() async {
    emit(state.copyWith(randomMuscleEntity: BaseState.loading()));

    final result = await _getRandomMusclesUseCase();

    switch (result) {
      case ApiSuccessResult<List<RandomMuscleEntity>>():
        emit(
          state.copyWith(randomMuscleEntity: BaseState.success(result.data)),
        );

      case ApiErrorResult<List<RandomMuscleEntity>>():
        emit(
          state.copyWith(
            randomMuscleEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }

  Future<void> _getMusclesUpcoming() async {
    emit(state.copyWith(musclesUpcomingEntity: BaseState.loading()));

    final result = await _getMusclesUpcomingUseCase();

    switch (result) {
      case ApiSuccessResult<List<MusclesUpcomingEntity>>():
        emit(
          state.copyWith(musclesUpcomingEntity: BaseState.success(result.data)),
        );

      case ApiErrorResult<List<MusclesUpcomingEntity>>():
        emit(
          state.copyWith(
            musclesUpcomingEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }

  Future<void> _getMusclesUpcomingGroup({required String groupId}) async {
    emit(state.copyWith(musclesUpcomingGroupEntity: BaseState.loading()));

    final result = await _getMusclesUpcomingByGroupIdUseCases(groupId: groupId);

    switch (result) {
      case ApiSuccessResult<List<MusclesUpcomingGroupEntity>>():
        emit(
          state.copyWith(
            musclesUpcomingGroupEntity: BaseState.success(result.data),
          ),
        );

      case ApiErrorResult<List<MusclesUpcomingGroupEntity>>():
        emit(
          state.copyWith(
            musclesUpcomingGroupEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }

  Future<void> _getFoodCategory() async {
    emit(state.copyWith(foodCategoryEntity: BaseState.loading()));

    final result = await _getFoodCategoryUseCase();

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
}
