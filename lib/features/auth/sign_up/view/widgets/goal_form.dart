import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/custom_span_text.dart';
import 'package:fitness_app/features/auth/sign_up/view/widgets/cutsom_radio.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class GoalForm extends StatefulWidget {
  const GoalForm({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  State<GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends State<GoalForm> {
  String selectedGoal = "";

  @override
  void initState() {
    super.initState();

    selectedGoal = context.read<SignupCubit>().goal ?? "";
  }

  void _onGoalChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedGoal = newValue; // Update UI (Radio button fills)
      });
      context.read<SignupCubit>().setGoal(newValue); // Update Data
    }
  }

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
              // --- Option 1 ---
              CustomRadio(
                title: "Gain Weight",
                value: "gain",
                groupValue: selectedGoal, // Use local variable
                onChanged: _onGoalChanged, // Use helper function
              ),
              // --- Option 2 ---
              CustomRadio(
                title: "Lose weight",
                value: "lose weight",
                groupValue: selectedGoal,
                onChanged: _onGoalChanged,
              ),
              // --- Option 3 ---
              CustomRadio(
                title: "Get fitter",
                value: "Get fitter",
                groupValue: selectedGoal,
                onChanged: _onGoalChanged,
              ),
              // --- Option 4 ---
              CustomRadio(
                title: "Gain more flexibility",
                value: "Gain more flexible",
                groupValue: selectedGoal,
                onChanged: _onGoalChanged,
              ),
              // --- Option 5 ---
              CustomRadio(
                title: "Learn the basics",
                value: "Learn the basic",
                groupValue: selectedGoal,
                onChanged: _onGoalChanged,
              ),

              SizedBox(height: 16.h),
              
              // --- Next Button ---
              CustomButton(
                buttonModel: ButtonModel(
                  text: "Next",
                  onPressed: () {
                     // Optional: Check if empty before proceeding
                     if(selectedGoal.isNotEmpty) {
                        widget.onPressed();
                     }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}