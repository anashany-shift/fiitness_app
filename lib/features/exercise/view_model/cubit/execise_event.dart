sealed class ExerciseEvent {}
class GetAllDataEvent extends ExerciseEvent{}
class GetDifficultyLevelEvent extends ExerciseEvent{
  final String primeMoveId;

  GetDifficultyLevelEvent({required this.primeMoveId});
  
}
class GetExerciseDetailsEvent extends ExerciseEvent{
    final String primeMoveId,levelId;

  GetExerciseDetailsEvent({required this.primeMoveId, required this.levelId});

}
