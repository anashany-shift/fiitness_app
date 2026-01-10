import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/exercise/view_model/cubit/exercise_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseStack extends StatefulWidget {
  const ExerciseStack({super.key});

  @override
  State<ExerciseStack> createState() => _ExerciseStackState();
}

class _ExerciseStackState extends State<ExerciseStack> {
  @override
  Widget build(BuildContext context) {
final cubit = context.watch<ExerciseCubit>();

    return Stack(
      children: [
        Container(
          height: 344.h,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(AppAssets.exercise),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xFF242424)],
                stops: [0.2, 0.95],
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset(AppAssets.backIcon),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ExerciseCubit, ExerciseState>(
                builder: (context, state) {
                  return Text(
                    cubit.targetMuscleGroup,
                    style: AppTextStyle.medium24,
                  );
                },
              ),
             
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.sp),

                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffd3d3d3)),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text("30 Min", style: AppTextStyle.regular12),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.sp),

                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffd3d3d3)),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "130 cal",
                      style: AppTextStyle.bold12.copyWith(
                        color: AppColors.mainColorL,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
