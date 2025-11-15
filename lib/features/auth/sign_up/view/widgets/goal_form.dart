import 'dart:ui';

import 'package:dartz/dartz.dart' hide State;
import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/cutsom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalForm extends StatefulWidget {
  const GoalForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends State<GoalForm> {
  String selectedGoal = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpanText(
          text1: "what is your goal?",
          text2: "this helps us create Your personalized plan ",
        ),
        SizedBox(height: 16.h),
        BlurredContainer(
          width: double.infinity,
          child: Column(
            children: [
              CustomRadio(
                title: "Gain Weight",
                value: "gain",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "lose weight",
                value: "lose weight",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "Get fitter",
                value: "Get fitter",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "Gain more flexible",
                value: "Gain more flexible",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "Learn the basic",
                value: "Learn the basic",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
              

              SizedBox(height: 16.h),
              CustomButton(
                buttonModel: ButtonModel(text: "Next", onPressed:widget.onPressed ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
