import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/recommendation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodRecommendationSection extends StatelessWidget {
  const FoodRecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: RecommendationItem(title: "BreakFast", imagePath: AppAssets.food),
                );
              },),
            ),
          ),
          
        ],
      ),
    );
  }
}
