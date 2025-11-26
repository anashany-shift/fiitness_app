import 'dart:ui';

import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({
    super.key,
    required this.title,
    required this.imagePath,
  });
  final String title, imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: 104.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 30.h,
                width: 104.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff242424).withOpacity(0.5),
                ),
                child: Center(
                  child: Text(title, style: AppTextStyle.regular12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
