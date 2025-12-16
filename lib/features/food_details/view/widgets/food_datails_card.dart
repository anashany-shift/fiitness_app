import 'dart:ui';

import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodDetailsCard extends StatelessWidget {
  const FoodDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text("Ingredients", style: AppTextStyle.extraBold20),
          SizedBox(height: 8.h),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Container(
                  width: double.infinity,

                  decoration: BoxDecoration(
                    color: Color(0xff242424).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Meal Breasts",
                              style: AppTextStyle.semiBold16,
                            ),
                            Text(
                              "250g",
                              style: AppTextStyle.regular12.copyWith(
                                color: AppColors.mainColorL,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: Colors.white12, // Faint divider line
                          height: 10,
                          thickness: 1,
                          
                        ),
                      );
                    },
                    itemCount: 10,
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
