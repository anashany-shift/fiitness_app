import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/features/auth/login/view/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_auth_app_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurredBackground(
      imagePath: AppAssets.authBg,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAuthAppBar(onBackTap: () {}),
            SizedBox(height: 78.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hey There\n', // first line
                      style: AppTextStyle.regular18,
                    ),
                    TextSpan(
                      text: 'WELCOME BACK', // second line
                      style: AppTextStyle.extraBold20,
                    ),
                  ],
                ),
              ),
            ),
        
            SizedBox(height: 16.h),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

