
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/features/auth/login/view/widgets/divider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OtherAuthSection extends StatelessWidget {
  const OtherAuthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          DividerSection(),
       SizedBox(height: 24.h),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
       
          Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SvgPicture.asset(AppAssets.facebook),
          ),
             Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SvgPicture.asset(AppAssets.googleIcon),
          ),
             Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SvgPicture.asset(AppAssets.appleIcon),
          ),
    
    
        ],
       )
    
      ],
    );
  }
}

