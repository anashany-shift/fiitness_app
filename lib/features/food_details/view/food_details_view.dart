import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/food_details/view/widgets/food_details_view_body.dart';
import 'package:fitness_app/features/food_details/view_model/cubit/food_details_cubit.dart';
import 'package:fitness_app/features/food_details/view_model/cubit/food_details_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key, required this.mealId});
  final String mealId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FoodDetailsCubit>()..doIntent(GetMealDetailsEvent(mealId: mealId)),
      child: Scaffold(body: FoodDetailsViewBody()),
    );
  }
}
