part of 'exercise_cubit.dart';

class ExerciseState extends Equatable {
  final BaseState<List<DifficultyLevelsEntity>>? difficultyLevelsEntity;
  final BaseState<List<ExerciseEntity>>? exerciseEntity;

  const ExerciseState({this.difficultyLevelsEntity, this.exerciseEntity});

  ExerciseState copyWith({
    final BaseState<List<DifficultyLevelsEntity>>? difficultyLevelsEntity,
      final BaseState<List<ExerciseEntity>>? exerciseEntity,

  }) {
    return ExerciseState(
      difficultyLevelsEntity:
          difficultyLevelsEntity ?? this.difficultyLevelsEntity,
          exerciseEntity: exerciseEntity??this.exerciseEntity,
    );
  }

  @override
  List<Object?> get props => [difficultyLevelsEntity,exerciseEntity];
}
