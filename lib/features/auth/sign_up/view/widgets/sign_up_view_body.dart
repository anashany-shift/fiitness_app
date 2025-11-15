import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/features/auth/login/view/widgets/custom_auth_app_bar.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/activity_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/age_form_.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/gender_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/goal_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/height_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/register_form.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/weight_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  int pageIndex = 0;
  late PageController pageController = PageController();

  void goToBack() {
    if (pageIndex > 0) {
      setState(() {
        pageIndex--;
      });
      pageController.jumpToPage(pageIndex);
    } else {
      Navigator.pop(context); // Exit if it's the first page
    }
  }

  void goToNextPage() {
    if (pageIndex < 6) {
      setState(() {
        pageIndex++;
      });
      pageController.jumpToPage(pageIndex);
    }
  }

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const int totalSteps = 6;

    return BlurredBackground(
      imagePath: AppAssets.authBg,
      child: Column(
        children: [
          CustomAuthAppBar(onBackTap: pageIndex != 0 ? goToBack : null),
          if (pageIndex > 0) ...[
            SizedBox(height: 85.h),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: pageIndex / totalSteps,
                   // strokeWidth: 6,
                                    
                                     
                  ),
                  Text(
                    "$pageIndex/$totalSteps",
                    style:AppTextStyle.medium14
                  ),
                ],
              ),
            ),
          ] else
            SizedBox.shrink(),
            SizedBox(height: 18,),

          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },

              children: [
                RegisterForm(onRegister: goToNextPage),
                GenderForm(onPressed:goToNextPage ,),
                AgeForm(onPressed: goToNextPage,),
                WeightForm(onPressed:goToNextPage ,),
                HeightForm(onPressed:goToNextPage ,),
                GoalForm(onPressed:goToNextPage ,),
                AcivityForm(onPressed:goToBack ,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
