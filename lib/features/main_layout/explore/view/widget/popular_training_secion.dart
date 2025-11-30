import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularTrainingSection extends StatelessWidget {
  const PopularTrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Traning", style: AppTextStyle.semiBold16),
          SizedBox(height: 8.h),
          SingleChildScrollView(

            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return Padding(
                  padding:  EdgeInsets.only(right: 16.0.w),
                  child: CustomImageContainer(
                    height: 176,
                    width: 200,
                    showsRow: true,
                    title: "exercises that\nstrengthen your Chest",
                    task: "24 Task",
                    level: "Beginner",
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

