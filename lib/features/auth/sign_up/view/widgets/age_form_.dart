import 'package:fitness_app/core/widget/custom_picker_number.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeForm extends StatefulWidget {
  const AgeForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<AgeForm> createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  int currentAge = 30;

  @override
  void initState() {
    super.initState();
    final cubitAge = context.read<SignupCubit>().age;

    if (cubitAge != null) {
      currentAge = cubitAge;
    } else {
      context.read<SignupCubit>().setAge(currentAge);
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SignupCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSpanText(
          text1: "How Old Are you ?",
          text2: "This helps us create your personalized plan",
        ),
        SizedBox(height: 16.h),
        CustomNumberPicker(
          initialValue: currentAge,
          minValue: 12,
          maxValue: 100,
          title: "Year",
          titleButton: "Next",

          onChanged: (newValue) {
            setState(() {
              currentAge = newValue;
            });
            cubit.setAge(newValue);
          },

          onPressed: () {
            cubit.setAge(currentAge);
            widget.onPressed();
          },
        ),
      ],
    );
  }
}
