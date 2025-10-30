import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlurredContainer(
      padding: EdgeInsetsGeometry.symmetric(vertical:24.sp,horizontal: 32.sp ),
      width: double.infinity,
      height: 398.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
          Text("Login",style: AppTextStyle.extraBold24,),
           SizedBox(height: 16.h),
           TextFormField(
            
           )
          
            
            
            ],),
      ),
    );
  }
}
