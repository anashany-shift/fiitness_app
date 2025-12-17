import 'dart:ui';

import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_datails_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsCard extends StatelessWidget {
  final FoodDatailsEntity food;

  const FoodDetailsCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      MapEntry(food.ingerdiant1, food.measurment1),
      MapEntry(food.ingerdiant2, food.measurment2),
      MapEntry(food.ingerdiant3, food.measurment3),
      MapEntry(food.ingerdiant4, food.measurment4),
      MapEntry(food.ingerdiant5, food.measurment5),
      MapEntry(food.ingerdiant6, food.measurment6),
      MapEntry(food.ingerdiant7, food.measurment7),
      MapEntry(food.ingerdiant8, food.measurment8),
      MapEntry(food.ingerdiant9, food.measurment9),
      MapEntry(food.ingerdiant10, food.measurment10),
      MapEntry(food.ingerdiant11, food.measurment11),
      MapEntry(food.ingerdiant12, food.measurment12),
    ].where((e) => e.key != null && e.key!.isNotEmpty).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ingredients", style: AppTextStyle.extraBold20),
          SizedBox(height: 8.h),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff242424).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.separated(
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      final item = ingredients[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item.key??"", style: AppTextStyle.semiBold16),
                            Text(
                              item.value ?? '',
                              style: AppTextStyle.regular12.copyWith(
                                color: AppColors.mainColorL,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(color: Colors.white12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
