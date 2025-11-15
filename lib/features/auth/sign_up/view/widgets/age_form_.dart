

import 'package:fitness_app/core/widget/custom_picker_number.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AgeForm extends StatefulWidget {
  const AgeForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<AgeForm> createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  int _currentIntValue = 30;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomSpanText(
          text1: "How Old Are you ?",
          text2: "this helps us create Your personalized plan ",
        ),
        SizedBox(height: 16.h),
        CustomNumberPicker(
          initialValue: _currentIntValue,
          minValue: 12,
          maxValue: 100,
          title: "Year",
          titleButton: "Next",
          onPressed:widget.onPressed ,
          onChanged: (value) =>setState(() {
            _currentIntValue=value;
          }) ,



        ),
      ],
    );
  }
}

