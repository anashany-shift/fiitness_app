import 'package:fitness_app/features/food_details/view/widgets/food_details_view_body.dart';
import 'package:flutter/material.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodDetailsViewBody(),
    );
  }
}