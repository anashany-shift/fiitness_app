import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Row(
            children: List.generate(10, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: GestureDetector(
                  onTap: () {
                  setState(() {
                    selectedIndex=index;
                  });
                  },
                  child: TabBarItem(isSelected: selectedIndex == index),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? AppColors.mainColorL : null,
      ),
      child: Text("Full Body", style: AppTextStyle.bold12),
    );
  }
}
