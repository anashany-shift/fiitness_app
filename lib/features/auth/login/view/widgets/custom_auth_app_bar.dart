
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key, this.onBackTap});
  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.sp, left: 16.sp, top: 46.sp),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(AppAssets.logo, height: 48.h, width: 70.w),
          ),
          onBackTap != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(AppAssets.backIcon),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
