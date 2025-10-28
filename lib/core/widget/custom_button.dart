import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/button_model.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonModel});
  final ButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (buttonModel.height ?? 0).h,
      width: (buttonModel.width ?? double.infinity).w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonModel.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
            side: BorderSide(
              color: buttonModel.backgroundColor != null
                  ? AppColors.mainColorL
                  : Colors.transparent,
            ),
          ),
        ),
        onPressed: buttonModel.onPressed,

        child: Text(buttonModel.text),
      ),
    );
  }
}
