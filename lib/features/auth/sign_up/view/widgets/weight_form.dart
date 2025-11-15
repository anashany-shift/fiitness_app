import 'package:fitness_app/core/widget/custom_picker_number.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightForm extends StatefulWidget {
  const WeightForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<WeightForm> createState() => _WeightFormState();
}

class _WeightFormState extends State<WeightForm> {
  int _currentIntValue = 90;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomSpanText(
          text1: "what is your weight  ",
          text2: "this helps us create Your personalized plan",
        ),
        SizedBox(height: 16.h),
        CustomNumberPicker(
          initialValue: _currentIntValue,
          minValue: 30,
          maxValue: 180,
          title: "Kg",
          titleButton: "Next",
          onPressed: widget.onPressed,
          onChanged: (value) => setState(() {
            _currentIntValue = value;
          }),
        ),
      ],
    );
  }
}
