import 'package:fitness_app/core/models/button_model.dart';

import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/male_and_female_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderForm extends StatelessWidget {
  const GenderForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpanText(
          text1: "tell us about yourself!",
          text2: "We Need To Know Your Gender",
        ),
        SizedBox(height: 16.h),
        BlurredContainer(
          width: double.infinity,
          child: Column(
            children: [
              MaleAndFemaleWidget(),
              SizedBox(height: 24.h),
              CustomButton(
                buttonModel: ButtonModel(text: ("Next"), onPressed: onPressed),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
