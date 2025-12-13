import 'package:fitness_app/features/exercise/view_model/cubit/execise_event.dart';
import 'package:fitness_app/features/exercise/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseLevelTabBar extends StatefulWidget {
  const ExerciseLevelTabBar({super.key, required this.primeMoveId});
  final String primeMoveId;
  @override
  State<ExerciseLevelTabBar> createState() => _ExerciseLevelTabBarState();
}

class _ExerciseLevelTabBarState extends State<ExerciseLevelTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff242424),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: BlocBuilder<ExerciseCubit, ExerciseState>(
        builder: (context, state) {
          if (state.difficultyLevelsEntity?.isLoading == true) {
            return Center(child:Text("Data Loading....."));
          }
          if (state.difficultyLevelsEntity?.errorMessage != null) {
            return Text(
              state.difficultyLevelsEntity?.errorMessage ?? "Error found",
            );
          }
          if (state.difficultyLevelsEntity?.data != null) {
            final level = state.difficultyLevelsEntity?.data;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(level?.length ?? 0, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0.w,
                      vertical: 10.0.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                    
                        final cubit = context.read<ExerciseCubit>();
                    
                        cubit.doIntent(
                          GetExerciseDetailsEvent(
                            primeMoveId: widget.primeMoveId,
                            levelId: level?[index].id ?? "",
                          ),
                        );
                      },
                      child: TabBarItem(
                        title: level?[index].name ?? "",
                        isSelected: selectedIndex == index,
                      ),
                    ),
                  );
                }),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
