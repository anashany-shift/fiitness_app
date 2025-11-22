import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/custom_dialog.dart';
import 'package:fitness_app/features/auth/login/view/widgets/custom_auth_app_bar.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/activity_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/age_form_.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/gender_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/goal_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/height_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/register_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/weight_form.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

 @override
Widget build(BuildContext context) {
  var cubit = context
      .watch<SignupCubit>(); 

  return BlocListener<SignupCubit, SignupState>(
  listener: (context, state) {

        if (state.isLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else if (state.signupEntityResponse != null) {
          Navigator.of(context).pop(); 
          showTopSnackBar(
            Overlay.of(context),
             CustomSnackBar.success(message: "SignUP successful!"),
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.login,
            (route) => false,
          );
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
      child: Column(
        children: [
          CustomAuthAppBar(
            onBackTap: cubit.state.pageIndex != 0 ? cubit.goToBack : null,
          ),

          if (cubit.state.pageIndex > 0) ...[
            SizedBox(height: 85.h),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: cubit.state.pageIndex / cubit.totalSteps,
                  ),
                  Text(
                    "${cubit.state.pageIndex}/${cubit.totalSteps}",
                    style: AppTextStyle.medium14,
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: 18),

          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: cubit.pageController,
              onPageChanged: (value) {
                cubit.changePage(value);
              },

              children: [
                RegisterForm(onRegister: cubit.goToNextPage),
                GenderForm(onPressed: cubit.goToNextPage),
                AgeForm(onPressed: cubit.goToNextPage),
                WeightForm(onPressed: cubit.goToNextPage),
                HeightForm(onPressed: cubit.goToNextPage),
                GoalForm(onPressed: cubit.goToNextPage),
                AcivityForm(onPressed: cubit.signUp),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


}