import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/features/food_details/view/widgets/food_datails_card.dart';
import 'package:fitness_app/features/food_details/view/widgets/food_datails_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsViewBody extends StatelessWidget {
  const FoodDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurredBackground(
      imagePath: AppAssets.homeBg,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          FoodDetailsStack(),
          SizedBox(height: 16.h,),
          Expanded(child: FoodDetailsCard()),

         ],
      ),
      
      
      
      );
  }
}
