import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/custom_button.dart';
import 'cutsom_radio.dart';

class AcivityForm extends StatefulWidget {
  const AcivityForm({super.key, required this.onPressed});
 final void Function() onPressed;

  @override
  State<AcivityForm> createState() => _AcivityFormState();
}

class _AcivityFormState extends State<AcivityForm> {
  String selectedGoal='';
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpanText(
          text1: "your regular physical",
          text2: "activity level?",
        ),
        SizedBox(height: 16.h),
        BlurredContainer(
          width: double.infinity,
          child: Column(
            children: [
              CustomRadio(
                title: "Rookie",
                value: "level1",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "Beginner",
                value: "level2",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "Intermediate",
                value: "level3",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "Advance",
                value: "level4",
                groupValue: selectedGoal,
                onChanged: (v) => setState(() => selectedGoal = v!),
              ),
                 CustomRadio(
                title: "True Beast",
                value: "level5",
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