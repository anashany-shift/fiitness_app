import 'package:fitness_app/core/widget/custom_picker_number.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightForm extends StatefulWidget {
  const HeightForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<HeightForm> createState() => _HeightFormState();
}

class _HeightFormState extends State<HeightForm> {
  int _currentIntValue = 165;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomSpanText(
          text1: "what is your Height  ",
          text2: "this helps us create Your personalized plan",
        ),
        SizedBox(height: 16.h),
        CustomNumberPicker(
          initialValue: _currentIntValue,
          minValue: 140,
          maxValue: 220,
          title: "Cm",
          fontSize: 40,
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
