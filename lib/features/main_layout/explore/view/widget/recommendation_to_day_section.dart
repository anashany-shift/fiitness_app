import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import 'recommendation_item.dart';

class RecommendationToDaySection extends StatelessWidget {
  const RecommendationToDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recommendation to day", style: AppTextStyle.semiBold16),
          SizedBox(height: 8.h),
          BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              if (state.randomMuscleEntity?.isLoading == true) {
                return Center(child: CircularProgressIndicator());
              }
              if (state.randomMuscleEntity?.errorMessage != null) {
                return Text(state.randomMuscleEntity?.errorMessage ?? "");
              }
              if (state.randomMuscleEntity?.data != null) {
                final muscle = state.randomMuscleEntity?.data;
                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 104.h),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: muscle?.length ?? 0,

                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.0.w),
                        child: RecommendationItem(
                          imagePath: muscle?[index].image ?? "",
                          title: muscle?[index].name ?? "",
                        ),
                      );
                    },
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
