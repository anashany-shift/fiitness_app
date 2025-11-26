import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import 'recommendation_item.dart';

class RecommendationToDaySection extends StatelessWidget {
  const RecommendationToDaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recommendation to day", style: AppTextStyle.semiBold16),
          SizedBox(height: 8.h),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 104.h),
            child: ListView.builder(
                 physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16.0.w),
                  child: RecommendationItem(
                    imagePath: AppAssets.rrr,
                    title: "jojjing  ",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
