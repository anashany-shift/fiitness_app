import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable{
  final String? exerciseId;
  final String? exerciseName;
  final String youtubeLink;
  final String? primeMoverMuscle;
  final String? muscleGroup;

  const ExerciseEntity({required this.exerciseId, required this.exerciseName, required this.youtubeLink, required this.primeMoverMuscle, required this.muscleGroup});
  
  @override
  List<Object?> get props => [exerciseId,exerciseName,youtubeLink,primeMoverMuscle,muscleGroup];



}