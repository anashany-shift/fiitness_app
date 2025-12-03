import 'package:fitness_app/features/main_layout/explore/view/widget/custom_tab_bar.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/upcoming_item.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingWorkoutsSection extends StatelessWidget {
  const UpcomingWorkoutsSection({super.key, this.onTapBar});
  final void Function(int index,String groupId)? onTapBar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTabBar(onTapBar: onTapBar,),
          SizedBox(height: 8.h),
          BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              if (state.musclesUpcomingGroupEntity?.isLoading == true) {
                return Center(child: CircularProgressIndicator());
              } 
              if (state.musclesUpcomingGroupEntity?.data != null) {
                final upcomingGroups = state.musclesUpcomingGroupEntity?.data;
                return  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(upcomingGroups?.length??0, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: UpcomingItem(
                        title: upcomingGroups?[index].name??"" ,
                        imagePath: upcomingGroups?[index].image??"",
                      ),
                    );
                  }),
                ),
              );
              } else if (state.musclesUpcomingGroupEntity?.errorMessage != null ) {
                return Center(child: Text(state.musclesUpcomingGroupEntity?.errorMessage ?? ""));
              }else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
