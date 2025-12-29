
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/responses/exercise/difficulty_levels_entity.dart';
import 'package:fitness_app/domain/entities/responses/exercise/exercise_entity.dart';
import 'package:fitness_app/domain/use_cases/exercise/get_difficulty_level_use_case.dart';
import 'package:fitness_app/domain/use_cases/exercise/get_exercise_datails_use_case.dart';
import 'package:fitness_app/features/exercise/view_model/cubit/execise_event.dart';
import 'package:injectable/injectable.dart';

part 'exercise_state.dart';
@injectable
class ExerciseCubit extends Cubit<ExerciseState> {
  final GetDifficultyLevelUseCase _getDifficultyLevelUseCase;
  final GetExerciseDatailsUseCase _getExerciseDatailsUseCase;
  ExerciseCubit(this._getDifficultyLevelUseCase, this._getExerciseDatailsUseCase) : super(ExerciseState());
  String targetMuscleGroup='';
  String disc='';



void doIntent(ExerciseEvent event){

  switch(event){
    

    case GetAllDataEvent():
     _getAllData();
    case GetDifficultyLevelEvent():
     _getDifficultyLevel(primeMoveId: event.primeMoveId);
     
     
    case GetExerciseDetailsEvent():
    _getExerciseDetails(primeMoveId: event.primeMoveId, levelId: event.levelId);
    
  }

}

void _getAllData()async{

 //await _getDifficultyLevel(primeMoveId: primeMoveId)
  
}
 Future<void> _getDifficultyLevel({required String primeMoveId}) async {
  emit(state.copyWith(difficultyLevelsEntity: BaseState(isLoading: true)));

  final result = await _getDifficultyLevelUseCase.call(
    primeMoveId: primeMoveId,
  );

  switch (result) {
    case ApiSuccessResult<List<DifficultyLevelsEntity>>():
      final levels = result.data;

      emit(
        state.copyWith(
          difficultyLevelsEntity: BaseState.success(levels),
        ),
      );

      // 🔥 هنا بقى نجيب أول Level تلقائيًا
      if (levels.isNotEmpty) {
        final firstLevelId = levels.first.id;

        // ننده event لجلب التمارين لأول مستوى
        doIntent(
          GetExerciseDetailsEvent(
            primeMoveId: primeMoveId,
            levelId: firstLevelId,
          ),
        );
      }

    case ApiErrorResult<List<DifficultyLevelsEntity>>():
      emit(
        state.copyWith(
          difficultyLevelsEntity: BaseState.error(result.errorMessage),
        ),
      );
  }
}

  Future<void> _getExerciseDetails({required String primeMoveId,required String levelId}) async {
    emit(state.copyWith(exerciseEntity: BaseState(isLoading: true)));
    final result = await _getExerciseDatailsUseCase.call(
      primeMoveId: primeMoveId,
      levelId: levelId
    );
    switch (result) {
      case ApiSuccessResult<List<ExerciseEntity>>():
        emit(
          state.copyWith(
            exerciseEntity: BaseState.success(result.data),
          ),
        );
        targetMuscleGroup=result.data.first.muscleGroup??'Exercise';
        disc=result.data.first.primeMoverMuscle??"";

      case ApiErrorResult<List<ExerciseEntity>>():
        emit(
          state.copyWith(
            exerciseEntity: BaseState.error(result.errorMessage),
          ),
        );
    }
  }
  
}
