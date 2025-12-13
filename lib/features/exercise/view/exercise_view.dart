import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/exercise/view/widgets/exercise_view_body.dart';
import 'package:fitness_app/features/exercise/view_model/cubit/execise_event.dart';
import 'package:fitness_app/features/exercise/view_model/cubit/exercise_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key, required this.primeMoveId});
  final String primeMoveId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ExerciseCubit>()..doIntent(GetDifficultyLevelEvent(primeMoveId: primeMoveId)),
      child: Scaffold(body: ExerciseViewBody( primeMoveId: primeMoveId,)),
    );
  }
}
