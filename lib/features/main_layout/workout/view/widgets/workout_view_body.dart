import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_image_container.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_tab_bar.dart';
import 'package:fitness_app/features/main_layout/workout/view_model/cubit/workout_cubit.dart';
import 'package:fitness_app/features/main_layout/workout/view_model/cubit/workout_cubit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutViewBody extends StatefulWidget {
  const WorkoutViewBody({this.indexNotifier, this.idNotifier, super.key});

final ValueNotifier<int>? indexNotifier;
  final ValueNotifier<String>? idNotifier;
  @override
  State<WorkoutViewBody> createState() => _WorkoutViewBodyState();
}

class _WorkoutViewBodyState extends State<WorkoutViewBody> {
  int selectedIndex = 0;
  
 @override
  void initState() {
    super.initState();

    if (widget.indexNotifier != null) {
      selectedIndex = widget.indexNotifier!.value;
    }

    if (widget.idNotifier != null && widget.idNotifier!.value.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final groupId = widget.idNotifier!.value;
        context.read<WorkoutCubit>().doIntent(WorkoutMuscleGroupEvent(groupId: groupId));
      });
    }

  
  }

 


  @override
  void dispose() {
    widget.indexNotifier?.value;
    widget.idNotifier?.value;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
      child: Column(
        children: [
          Text("Workouts", style: AppTextStyle.semiBold24),
          SizedBox(height: 24.h),

          BlocBuilder<WorkoutCubit, WorkoutState>(
            builder: (context, state) {
              if (state.musclesUpcomingEntity?.isLoading == true) {
                return Center(child: CircularProgressIndicator());
              }

              if (state.musclesUpcomingEntity?.data != null) {
                final upcomingGroups = state.musclesUpcomingEntity?.data;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  child: Row(
                    children: List.generate(upcomingGroups?.length ?? 0, (
                      index,
                    ) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            final groupId = upcomingGroups?[index].id;
                            context.read<WorkoutCubit>().doIntent(
                              WorkoutMuscleGroupEvent(groupId: groupId),
                            );
                          },
                          child: TabBarItem(
                            isSelected: selectedIndex == index,
                            title: upcomingGroups?[index].name ?? "",
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }

              if (state.musclesUpcomingEntity?.errorMessage != null) {
                return Center(
                  child: Text(state.musclesUpcomingEntity?.errorMessage ?? ""),
                );
              }

              return SizedBox.shrink();
            },
          ),

          SizedBox(height: 24.h),

          Expanded(
            child: BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                if (state.musclesUpcomingGroupEntity?.isLoading == true) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state.musclesUpcomingGroupEntity?.data != null) {
                  final upcomingGroups = state.musclesUpcomingGroupEntity?.data;

                  return GridView.builder(
                    itemCount: upcomingGroups?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 163 / 160,
                      mainAxisSpacing: 18.h,
                      crossAxisSpacing: 18.w,
                    ),
                    itemBuilder: (context, index) {
                      return CustomImageContainer(
                        imagePath: upcomingGroups?[index].image ?? "",
                        title: upcomingGroups?[index].name ?? "",
                        width: 163,
                        height: 160,
                      );
                    },
                  );
                }

                if (state.musclesUpcomingGroupEntity?.errorMessage != null) {
                  return Center(
                    child: Text(
                      state.musclesUpcomingGroupEntity?.errorMessage ?? "",
                    ),
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
