import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/features/exercise/view/widgets/exercise_video_dialog.dart';
import 'package:fitness_app/features/food_details/view/widgets/food_datails_card.dart';
import 'package:fitness_app/features/food_details/view/widgets/food_datails_stack.dart';
import 'package:fitness_app/features/food_details/view_model/cubit/food_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsViewBody extends StatelessWidget {
  const FoodDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
      builder: (context, state) {
        final baseState = state.foodDatailsEntity;

        if (baseState?.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }

        if (baseState?.errorMessage != null) {
          return Center(child: Text(baseState?.errorMessage ?? ""));
        }

        final food = baseState?.data?.first;
        if (food == null) {
          return const Center(child: Text("No Data"));
        }

        return BlurredBackground(
          imagePath: AppAssets.homeBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FoodDetailsStack(
                onPlayTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ExerciseVideoDialog(
                        youtubeLink: food.videoLink ?? '',
                      );
                    },
                  );
                },
                imageCover: food.imageCover ?? "",
                title: food.title ?? '',
                desc: food.desc ?? '',
                info: [
                  food.measurment1 ?? '',
                  food.measurment2 ?? '',
                  food.measurment3 ?? '',
                  food.measurment4 ?? '',
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(child: FoodDetailsCard(food: food)),
            ],
          ),
        );
      },
    );
  }
}
