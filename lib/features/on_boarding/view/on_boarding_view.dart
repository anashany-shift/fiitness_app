import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/features/on_boarding/view/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:OnBoardingViewBody()
      ),
    );
  }
}
