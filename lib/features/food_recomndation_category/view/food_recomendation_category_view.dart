import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/food_recomndation_category/view/widgets/food_recommendation_category_view_body.dart';
import 'package:fitness_app/features/food_recomndation_category/view_model/cubit/food_recommendation_cubit.dart';
import 'package:fitness_app/features/food_recomndation_category/view_model/cubit/food_recommendation_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodRecomendationCategoryView extends StatelessWidget {
  const FoodRecomendationCategoryView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<FoodRecommendationCubit>()
            ..doIntent(GetAllFoodDataEvent(startWithCategory: categoryName)),
      child: SafeArea(
        child: Scaffold(
          body: FoodRecommendationCategoryViewBody(
            currentCategoryName: categoryName,
          ),
        ),
      ),
    );
  }
}
