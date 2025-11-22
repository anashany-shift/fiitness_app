import 'package:fitness_app/core/widget/custom_picker_number.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightForm extends StatefulWidget {
  const WeightForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<WeightForm> createState() => _WeightFormState();
}


class _WeightFormState extends State<WeightForm> {
  int currentIntValue = 50;

  @override
  void initState() {
    final weightCubit=context.read<SignupCubit>().weight;

    if(weightCubit!=null){
      currentIntValue=weightCubit;
    }else{
      context.read<SignupCubit>().setAge(currentIntValue);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        var cubit =context.read<SignupCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomSpanText(
          text1: "what is your weight  ",
          text2: "this helps us create Your personalized plan",
        ),
        SizedBox(height: 16.h),
        CustomNumberPicker(
          
          initialValue: currentIntValue,
          minValue: 30,
          maxValue: 180,
          title: "Kg",
          titleButton: "Next",
          onPressed: (){
            cubit.setWeight(currentIntValue);
            widget.onPressed();
          },
          onChanged: (value) {
            setState(() {
              currentIntValue=value;
            });
            cubit.setWeight(value);


          }
        ),
      ],
    );
  }
}
