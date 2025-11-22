import 'package:fitness_app/core/helper/validation.dart';
import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/models/text_form_filed.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/core/widget/custom_text_form_field.dart';
import 'package:fitness_app/features/auth/login/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/routes/routes.dart';
import 'have_an_account.dart';
import 'other_auth_section.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlurredContainer(
      padding: EdgeInsetsGeometry.symmetric(vertical: 24.sp, horizontal: 32.sp),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Text("Login", style: AppTextStyle.extraBold24),
              SizedBox(height: 16.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  controller: cubit.emailController,
                 
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
              ValueListenableBuilder(
                valueListenable: cubit.isPasswordVisible,
                builder: (context, isvisible, child) {
                  return CustomTextFormField(
                    textFormFieldModel: TextFormFieldModel(
                      controller: cubit.passwordController,
                      hint: "Password",
                      obscureText: !isvisible,
                      validator: Validation.validatePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          !isvisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 24,
                        ),
                        onPressed: cubit.passwordVisabilty,
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
                  );
                },
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
                buttonModel: ButtonModel(
                  text: "Login",
                  onPressed: () {
                    cubit.loginValidate(formKey: cubit.formKey);
                  },
                ),
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
