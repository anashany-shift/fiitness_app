import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

import 'blurred_container.dart';

class CustomNumberPicker extends StatelessWidget {
  const CustomNumberPicker({
    super.key,

    required this.title,
    required this.titleButton,
    required this.initialValue,
    required this.maxValue,
    required this.minValue,
    required this.onChanged,
    required this.onPressed,
    this.fontSize = 44,
  });
  final String title, titleButton;
  final int initialValue, maxValue, minValue;
  final void Function(int) onChanged;
  final void Function() onPressed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return BlurredContainer(
      width: double.infinity,
      child: Column(
        children: [
          Text(title),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: NumberPicker(
              minValue: minValue,
              maxValue: maxValue,
              value: initialValue,
              axis: Axis.horizontal,
              itemCount: 5,
              infiniteLoop: false,
              itemWidth: 72.w,
              itemHeight: 80,

              haptics: true,
              step: 1,
              selectedTextStyle: TextStyle(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w900,
              ),
              textStyle: TextStyle(
                fontSize: 33.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),

              onChanged: onChanged,
            ),
          ),
          SizedBox(height: 8.h),
          SvgPicture.asset(AppAssets.arrow),
          SizedBox(height: 24.h),
          CustomButton(
            buttonModel: ButtonModel(text: (titleButton), onPressed: onPressed),
          ),
        ],
      ),
    );
  }
}
