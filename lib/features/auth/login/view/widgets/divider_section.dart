import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
           width: 80.w,
          child: Divider(
            thickness: 2,
            color: AppColors.lgihtGray,
          
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Text("Or",style: AppTextStyle.regular12,),
        ),
           SizedBox(
          width: 80.w,
          child: Divider(
            thickness: 2,
            color: AppColors.lgihtGray,
          
          ),
        ),
      ],
    );
  }
}
