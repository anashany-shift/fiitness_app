import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/custom_dialog.dart';
import 'package:fitness_app/features/auth/login/view/widgets/login_form.dart';
import 'package:fitness_app/features/auth/login/view_model/cubit/login_cubit.dart';
import 'package:fitness_app/features/auth/login/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'custom_auth_app_bar.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {

        if (state.isLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else if (state.loginEntity != null) {
          Navigator.of(context).pop(); 
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(message: "Login successful!"),
          );
          // Navigator.pushNamedAndRemoveUntil(
          //   context,
          //   Routes.mainLayout,
          //   (route) => false,
          // );
        } else if (state.errorMessage != null) {
          Navigator.of(context).pop(); // Close loading dialog
          showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(
                message: state.errorMessage ?? "",
                showTwoButtons: false,
              );
            },
          );
        }
      },

      child: BlurredBackground(
        imagePath: AppAssets.authBg,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAuthAppBar(),
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
      ),
    );
  }
}
