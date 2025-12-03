import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/use_cases/main_layout/workout_use_cases/workout_get_muscle_upcoming_category.dart';
import 'package:fitness_app/domain/use_cases/main_layout/workout_use_cases/workout_get_muscle_upcoming_group.dart';
import 'package:fitness_app/features/main_layout/workout/view_model/cubit/workout_cubit_event.dart';
import 'package:injectable/injectable.dart';

part 'workout_state.dart';
@injectable
class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutGetMuscleUpcomingCategoryUseCase getWorkoutMuscleUpcomingUseCase;
  final WorkoutGetMuscleUpcomingGroupUseCase getWorkoutMuscleUpcomingGroupUseCase;
  WorkoutCubit(
    this.getWorkoutMuscleUpcomingUseCase,
    this.getWorkoutMuscleUpcomingGroupUseCase,
  ) : super(WorkoutState());




  void doIntent(WorkoutCubitEvent event) {
    switch (event) {
      case WorkoutGetMuscleUpcoming():
        _getMusclesUpcoming();
        return;

      case WorkoutMuscleGroupEvent():
        _getMusclesUpcomingGroup(groupId: event.groupId ?? "");
        return;
      case WorkoutGetAllData():
      _getAllData();
      return;
        
    }
  }   
  void _getAllData() async {
    await _getMusclesUpcoming();

    final groupId = state.musclesUpcomingEntity?.data?.first.id;

    if (groupId != null && groupId.isNotEmpty) {
      await _getMusclesUpcomingGroup(groupId: groupId);
    }
  }
  
  Future<void> _getMusclesUpcoming() async {
    emit(state.copyWith(
        musclesUpcomingEntity: BaseState.loading()));
    final result = await  getWorkoutMuscleUpcomingUseCase.call();
   switch (result) {
      case ApiSuccessResult<List<MusclesUpcomingEntity>>():
        emit(state.copyWith(
            musclesUpcomingEntity:
                BaseState.success( result.data)));
        return;
        case ApiErrorResult<List<MusclesUpcomingEntity>>():
        emit(state.copyWith(
            musclesUpcomingEntity:
                BaseState.error( result.errorMessage)));
        return;
    }
  }
  Future<void> _getMusclesUpcomingGroup({required String groupId}) async {
    emit(state.copyWith(
        musclesUpcomingGroupEntity: BaseState.loading()));
    final result = await  getWorkoutMuscleUpcomingGroupUseCase(groupId: groupId);
   switch (result) {
      case ApiSuccessResult<List<MusclesUpcomingGroupEntity>>():
        emit(state.copyWith(
            musclesUpcomingGroupEntity:
                BaseState.success( result.data)));
        return;
        case ApiErrorResult<List<MusclesUpcomingGroupEntity>>():
        emit(state.copyWith(
            musclesUpcomingGroupEntity:
                BaseState.error( result.errorMessage)));
        return;
    }
  }


}





