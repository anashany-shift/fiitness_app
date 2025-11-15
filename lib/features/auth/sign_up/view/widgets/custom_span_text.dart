import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpanText extends StatelessWidget {
  const CustomSpanText({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$text1\n', // first line
                  style:  AppTextStyle.extraBold20,
                ),
                TextSpan(
                  text: text2, // second line
                  style:AppTextStyle.regular16
                ),
              ],
            ),
          ),
        );
  }
}