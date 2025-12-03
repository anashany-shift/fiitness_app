import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit_event.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, this.onTapBar});
  final void Function(int index,String groupId)? onTapBar;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<ExploreCubit>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Upcoming Workouts", style: AppTextStyle.semiBold16),
            Text(
              "See All",
              style: AppTextStyle.regular14.copyWith(
                color: AppColors.mainColorL,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        BlocBuilder<ExploreCubit, ExploreState>(
          builder: (context, state) {
            if (state.musclesUpcomingEntity?.isLoading == true) {
              return Center(child: CircularProgressIndicator());
            }
            if (state.musclesUpcomingEntity?.data != null) {
              final musclesGroup = state.musclesUpcomingEntity?.data;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                child: Row(
                  children: List.generate(musclesGroup?.length ?? 0, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;

                          });
                          final groupId=musclesGroup?[index].id;
                          cubit.doIntent(ExploreMuscleGroupEvent(groupId));
                          if(widget.onTapBar!=null){
                            widget.onTapBar!(index,groupId??"");
                          }

                        },
                        child: TabBarItem(
                          isSelected: selectedIndex == index,
                          title: musclesGroup?[index].name ?? "",
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
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, required this.isSelected, required this.title});
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? AppColors.mainColorL : null,
      ),
      child: Text(title, style: AppTextStyle.bold12),
    );
  }
}
