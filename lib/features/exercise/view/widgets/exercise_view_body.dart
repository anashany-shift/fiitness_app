import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/features/exercise/view/widgets/excercise_card_list_view.dart';
import 'package:fitness_app/features/exercise/view/widgets/exercise_level_tab_bar.dart';
import 'package:fitness_app/features/exercise/view/widgets/exercise_stack.dart';
import 'package:flutter/material.dart';

class ExerciseViewBody extends StatelessWidget {
  const ExerciseViewBody({super.key, required this.primeMoveId});
final String primeMoveId;
  @override
  Widget build(BuildContext context) {
    return BlurredBackground(
      imagePath: AppAssets.homeBg,
      child: Column(
        children: [
          ExerciseStack(),
          ExerciseLevelTabBar(primeMoveId: primeMoveId,),
          ExerciseCardListView(),
        ],
      ),
    );
  }
}
