
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFoodInfo extends StatelessWidget {
  const CustomFoodInfo({
    super.key, required this.info,
  });
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
    
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffd3d3d3)),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        info,
        style: AppTextStyle.bold12.copyWith(
          color: AppColors.mainColorL,
        ),
      ),
    );
  }
}
