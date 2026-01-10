part of 'workout_cubit.dart';

 class WorkoutState extends Equatable {
  const WorkoutState({this.musclesUpcomingEntity, this.musclesUpcomingGroupEntity});

  final BaseState<List<MusclesUpcomingEntity>>?musclesUpcomingEntity;
  final BaseState<List<MusclesUpcomingGroupEntity>>?musclesUpcomingGroupEntity;
  WorkoutState copyWith({
    final BaseState<List<MusclesUpcomingEntity>>?musclesUpcomingEntity,
    final BaseState<List<MusclesUpcomingGroupEntity>>?musclesUpcomingGroupEntity,
  }) {
    return WorkoutState(
       musclesUpcomingEntity:musclesUpcomingEntity??this.musclesUpcomingEntity,
      musclesUpcomingGroupEntity: musclesUpcomingGroupEntity??this.musclesUpcomingGroupEntity,
    );
  }

  @override
  List<Object?> get props => [musclesUpcomingEntity,musclesUpcomingGroupEntity];
}
