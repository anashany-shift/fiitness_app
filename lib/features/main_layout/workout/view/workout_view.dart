import 'package:fitness_app/features/main_layout/workout/view/widgets/workout_view_body.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key, this.indexNotifier, this.idNotifier});
final ValueNotifier<int>? indexNotifier;
  final ValueNotifier<String>? idNotifier;
  @override
  Widget build(BuildContext context) {
    return WorkoutViewBody(idNotifier:idNotifier ,indexNotifier:indexNotifier ,);
  }
}
