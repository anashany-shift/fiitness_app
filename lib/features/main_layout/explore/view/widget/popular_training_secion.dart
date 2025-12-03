import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularTrainingSection extends StatelessWidget {
  PopularTrainingSection({super.key});
  List<String> images = [
    "https://images.pexels.com/photos/4162449/pexels-photo-4162449.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/4761352/pexels-photo-4761352.jpeg?auto=compress&cs=tinysrgb&w=600",
  ];
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
              children: List.generate(2, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: CustomImageContainer(
                    imagePath: images[index],
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
