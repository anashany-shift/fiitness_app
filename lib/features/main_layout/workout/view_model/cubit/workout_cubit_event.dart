sealed class WorkoutCubitEvent {}
class WorkoutGetMuscleUpcoming extends WorkoutCubitEvent {}
class WorkoutGetAllData extends WorkoutCubitEvent {}
class WorkoutMuscleGroupEvent extends WorkoutCubitEvent{
  final String? groupId;

  WorkoutMuscleGroupEvent({this.groupId});
}