import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/food_recommendation_section.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/popular_training_secion.dart';

import 'package:fitness_app/features/main_layout/explore/view/widget/upcoming_section.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/category_section.dart';

import 'widget/explore_header.dart';
import 'widget/recommendation_to_day_section.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ExploreCubit>()..doIntent(ExploreGetAllData()),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExploreHeader(),
              SizedBox(height: 20.h),
              CategorySection(),
              SizedBox(height: 20.h),
              RecommendationToDaySection(),
              SizedBox(height: 20.h),
              UpcomingWorkoutsSection(),
              SizedBox(height: 20.h),
              FoodRecommendationSection(),
              SizedBox(height: 20.h),
              PopularTrainingSection(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
