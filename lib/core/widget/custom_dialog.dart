import 'dart:ui';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/widget/custom_button.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onYes;
  final VoidCallback? onNo;
  final VoidCallback? onOk;
  final bool showTwoButtons;

  const CustomDialog({
    super.key,
    required this.message,
    this.onYes,
    this.onNo,
    this.onOk,
    this.showTwoButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            width: 280.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
             // color: const Color(0x80242424), // #24242480
              borderRadius: BorderRadius.circular(20),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Color(0x40000000), // #00000040
              //     blurRadius: 10,
              //     offset: Offset(0, 0),
              //   ),
              // ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style:AppTextStyle.extraBold20
                ),
                SizedBox(height: 24.h),
                showTwoButtons ? _buildYesNoButtons(context) : _buildOkButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildYesNoButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomButton(
            buttonModel: ButtonModel(
              text: "NO",
              backgroundColor: Colors.transparent,
              onPressed: onNo ?? () => Navigator.pop(context),
              width: 80,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomButton(
            buttonModel: ButtonModel(
              text: "Yes",
              backgroundColor: AppColors.mainColorL,
              onPressed: onYes ?? () => Navigator.pop(context),
              width: 80,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOkButton(BuildContext context) {
    return CustomButton(
      buttonModel: ButtonModel(
        text: "OK",
        backgroundColor: AppColors.mainColorL,
        onPressed: onOk ?? () => Navigator.pop(context),
        width: 80,
      ),
    );
  }
}
