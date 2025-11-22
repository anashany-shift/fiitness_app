import 'package:fitness_app/core/helper/validation.dart';
import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/models/text_form_filed.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/core/widget/custom_text_form_field.dart';
import 'package:fitness_app/features/auth/login/view/widgets/other_auth_section.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routes/routes.dart';
import '../../../login/view/widgets/have_an_account.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.onRegister});
  final void Function() onRegister;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState>key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    var cubit =context.read<SignupCubit>();
    return SingleChildScrollView(
      child: Column(
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
                  key: key,
                  child: Column(
                    children: [
                      Text("Register", style: AppTextStyle.extraBold24),
                          SizedBox(height: 16.h),
                       CustomTextFormField(
                        textFormFieldModel: TextFormFieldModel(
                          controller: cubit.firstName,
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
                          controller: cubit.lastName,
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
                          controller: cubit.email,
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
                        valueListenable: cubit.isvisiable,
                        builder: (context, isvisiable, child) {
                          return CustomTextFormField(
                            textFormFieldModel: TextFormFieldModel(
                              controller: cubit.password,
                              hint: "Password",
                              obscureText:!isvisiable ,
                              validator: Validation.validatePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isvisiable
                                      ?Icons.visibility_outlined
                                      : Icons.visibility_off_outlined ,
                                  size: 24,
                                ),
                                onPressed: () {
                                  cubit.isPasswordVisible();
                                },
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
                        }
                      ),
                       
                      SizedBox(height: 24.h),
                       
                      OtherAuthSection(),
                      SizedBox(height: 24.h),
                      CustomButton(
                        buttonModel: ButtonModel(text: "Register", onPressed: (){
                          if (key.currentState!.validate()){
                            widget.onRegister();
                          }
                        }),
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
      ),
    );
  }
}
