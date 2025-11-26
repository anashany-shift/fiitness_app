

import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_tab_bar.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/upcoming_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingWorkoutsSection extends StatelessWidget {
  const UpcomingWorkoutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),

      child: Column(
        children: [
          CustomTabBar(),
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: List.generate(10, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: UpcomingItem(
                    title: "Chest",
                    imagePath: AppAssets.recomendedImage,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}