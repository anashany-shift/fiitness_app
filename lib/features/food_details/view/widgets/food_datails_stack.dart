import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/food_details/view/widgets/custom_food_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FoodDetailsStack extends StatelessWidget {
  const FoodDetailsStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 344.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),

            image: const DecorationImage(
              image: AssetImage(AppAssets.exercise),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pasta and Beef", style: AppTextStyle.medium24),

              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: List.generate(4, (index) {
                  return CustomFoodInfo(info: "ansas");
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
