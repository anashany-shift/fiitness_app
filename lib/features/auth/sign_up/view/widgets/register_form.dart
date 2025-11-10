import 'package:fitness_app/core/helper/validation.dart';
import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/models/text_form_filed.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/core/widget/custom_text_form_field.dart';
import 'package:fitness_app/features/auth/login/view/widgets/other_auth_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routes/routes.dart';
import '../../../login/view/widgets/have_an_account.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key, required this.onRegister});
  final void Function() onRegister;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 34.h),
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
                  text: 'Create An Account', // second line
                  style: AppTextStyle.extraBold20,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        BlurredContainer(
          padding: EdgeInsetsGeometry.symmetric(
            vertical: 24.sp,
            horizontal: 32.sp,
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  Text("Register", style: AppTextStyle.extraBold24),
                      SizedBox(height: 16.h),
                   CustomTextFormField(
                    textFormFieldModel: TextFormFieldModel(
                      hint: "First Name",
                      validator: Validation.validateText,
                      preSuffix: Padding(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppAssets.nameIcon,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                      CustomTextFormField(
                    textFormFieldModel: TextFormFieldModel(
                      hint: "Last Name",
                      validator: Validation.validateText,
                      preSuffix: Padding(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppAssets.nameIcon,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    textFormFieldModel: TextFormFieldModel(
                      hint: "Email",
                      validator: Validation.validateEmail,
                      preSuffix: Padding(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppAssets.emailIcon,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    textFormFieldModel: TextFormFieldModel(
                      hint: "Password",
                      obscureText: false,
                      validator: Validation.validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          true
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                      preSuffix: Padding(
                        padding: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppAssets.passwordIcon,
                          height: 16.h,
                          width: 16.w,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  OtherAuthSection(),
                  SizedBox(height: 24.h),
                  CustomButton(
                    buttonModel: ButtonModel(text: "Register", onPressed: onRegister),
                  ),
                  HaveAnAccount(
                    onTap: () => Navigator.pushNamed(context, Routes.login),
                    text1: "Already have an account ?",
                    text2: "Login",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
