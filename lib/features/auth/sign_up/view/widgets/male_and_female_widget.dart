import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/auth/sign_up/view_model/cubit/signup_cubit.dart' show SignupCubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaleAndFemaleWidget extends StatefulWidget {
  const MaleAndFemaleWidget({super.key});

  @override
  State<MaleAndFemaleWidget> createState() => _MaleAndFemaleWidgetState();
}

class _MaleAndFemaleWidgetState extends State<MaleAndFemaleWidget> {
  String? selectedGender; 
  @override
  void initState() {

    final genderCubit=context.read<SignupCubit>().gender;
    if(genderCubit!=null){
      selectedGender=genderCubit;
    }else{
      context.read<SignupCubit>().setGender(selectedGender??"");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        var cubit =context.read<SignupCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
             
             selectedGender="male";
           
            });
              cubit.gender=selectedGender;
          },
          child: GenderCircle(
            icon: AppAssets.male,
            label: "Male",
            isSelected: selectedGender == "male",
          ),
        ),
    
        SizedBox(height: 24.w),
    
        GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = "female";
            });
             cubit.gender=selectedGender;
          },
          child: GenderCircle(
            icon: AppAssets.female,
            label: "Female",
            isSelected: selectedGender == "female",
          ),
        ),
      ],
    );
  }
}

class GenderCircle extends StatelessWidget {
  const GenderCircle({
    super.key,
    required this.isSelected,
    required this.label,
    required this.icon,
  });

  final bool isSelected;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 100.w,
      width: 100.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.mainColorL: Colors.transparent,
        border: Border.all(
          color: isSelected ? AppColors.mainColorL : Colors.white,
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(icon, fit: BoxFit.contain)),
            SizedBox(height: 6.h),
            Text(
              label,
              style: AppTextStyle.semiBold14
            ),
          ],
        ),
      ),
    );
  }
}
