
import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key, required this.text1, required this.text2, this.onTap,
  });
  final String text1;
  final String text2;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: AppTextStyle.regular14,
            ),
            TextSpan(
              text: text2,
              style: AppTextStyle.regular14.copyWith(
                color: AppColors.mainColorL,
              ),
              recognizer:TapGestureRecognizer()..onTap=onTap
            ),
          ],
        ),
      ),
    );
  }
}
