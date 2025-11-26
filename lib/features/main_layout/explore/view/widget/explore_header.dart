


import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.perosn),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(100.sp),
        ),
      ),
      title: Text('Hi Anas,', style: AppTextStyle.medium16),
      subtitle: Text('Let’s start your day', style: AppTextStyle.bold20),
    );
  }
}