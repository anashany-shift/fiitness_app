import 'package:fitness_app/core/helper/validation.dart';
import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/models/text_form_filed.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/routes/routes.dart';
import 'have_an_account.dart';
import 'other_auth_section.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlurredContainer(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.sp, horizontal: 32.sp),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Text("Login", style: AppTextStyle.extraBold24),
              SizedBox(height: 16.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  hint: "Email",
                  validator: Validation.validateEmail,
                  preSuffix: Padding(
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AppAssets.emailIcon,
                      height: 16.h,
                      width: 16.w,
                      //    fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  hint: "Password",
                  obscureText: true,
                  validator: Validation.validatePassword,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppAssets.eyeIcon,
                      height: 16.h,
                      width: 16.w,
                      //    fit: BoxFit.scaleDown,
                    ),
                  ),
                  preSuffix: Padding(
                    padding: EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      AppAssets.passwordIcon,
                      height: 16.h,
                      width: 16.w,
                      //    fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget Password?",
                    style: AppTextStyle.regular12.copyWith(
                      color: AppColors.mainColorL,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              OtherAuthSection(),
              SizedBox(height: 24.h),
              CustomButton(
                buttonModel: ButtonModel(text: "Login", onPressed: () {}),
              ),
              HaveAnAccount(
                onTap: () => Navigator.pushNamed(context, Routes.signUp),
                text1: "Dont have an account yet?",
                text2: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
