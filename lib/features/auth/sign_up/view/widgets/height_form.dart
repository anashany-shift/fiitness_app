import 'package:fitness_app/core/widget/custom_picker_number.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightForm extends StatefulWidget {
  const HeightForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<HeightForm> createState() => _HeightFormState();
}

class _HeightFormState extends State<HeightForm> {
  int currentIntValue = 165;
  @override
  void initState() {
    super.initState();
    final cubitHeight= context.read<SignupCubit>().height;
    
    if (cubitHeight != null) {
      currentIntValue = cubitHeight;
    } else {
      // If first time, set the default 30 into the cubit immediately
      context.read<SignupCubit>().setAge(currentIntValue);
    }
  }

  @override
  Widget build(BuildContext context) {
        var cubit =context.read<SignupCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomSpanText(
          text1: "what is your Height  ",
          text2: "this helps us create Your personalized plan",
        ),
        SizedBox(height: 16.h),
        CustomNumberPicker(
          initialValue: currentIntValue,
          minValue: 140,
          maxValue: 220,
          title: "Cm",
          fontSize: 40,
          titleButton: "Next",
          onPressed:(){
            cubit.setHeight(currentIntValue);
            widget.onPressed();
          },
          onChanged: (value){
            setState(() {
              currentIntValue = value; // Updates the UI
            });
            cubit.setHeight(value);
          }
        ),
      ],
    );
  }
}
