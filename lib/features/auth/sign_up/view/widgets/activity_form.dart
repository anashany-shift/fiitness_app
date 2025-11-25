import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../view_model/cubit/signup_cubit.dart';
import 'cutsom_radio.dart';

class AcivityForm extends StatefulWidget {
  const AcivityForm({super.key, required this.onPressed});
 final void Function() onPressed;

  @override
  State<AcivityForm> createState() => _AcivityFormState();
}

class _AcivityFormState extends State<AcivityForm> {
   String selectedActivity = "";

  @override
  void initState() {
    super.initState();

    selectedActivity = context.read<SignupCubit>().activityLevel ?? "";
  }

  void _onActivityChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedActivity = newValue; // Update UI (Radio button fills)
      });
      context.read<SignupCubit>().setActivityLevel(newValue); // Update Data
    }
  }
  @override
  Widget build(BuildContext context) {
      //  var cubit =context.read<SignupCubit>();

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
                groupValue: selectedActivity,
                onChanged: _onActivityChanged ,
              ),
                 CustomRadio(
                title: "Beginner",
                value: "level2",
                     groupValue: selectedActivity,
                onChanged: _onActivityChanged ,
              ),
                 CustomRadio(
                title: "Intermediate",
                value: "level3",
                   groupValue: selectedActivity,
                onChanged: _onActivityChanged ,
              ),
                 CustomRadio(
                title: "Advance",
                value: "level4",
                   groupValue: selectedActivity,
                onChanged: _onActivityChanged ,
              ),
                 CustomRadio(
                title: "True Beast",
                value: "level5",
                     groupValue: selectedActivity,
                onChanged: _onActivityChanged ,
              ),
              

              SizedBox(height: 16.h),
              CustomButton(
                buttonModel: ButtonModel(text: "Next", onPressed:() {
                  if(selectedActivity.isNotEmpty) {
                        widget.onPressed();
                     }
                },),
              ),
            ],
          ),
        ),
      ],
    );
  }
}