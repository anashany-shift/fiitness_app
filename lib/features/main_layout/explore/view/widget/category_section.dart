import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatelessWidget {
  CategorySection({super.key});
  final List<CategoryItemModel> items = [
    CategoryItemModel(title: "Gym", imagePath: AppAssets.cat1),
    CategoryItemModel(title: "Fitness", imagePath: AppAssets.cat2),
    CategoryItemModel(title: "Yoga", imagePath: AppAssets.cat3),
    CategoryItemModel(title: "Aerobics", imagePath: AppAssets.cat4),
    CategoryItemModel(title: "Trainer", imagePath: AppAssets.cat5),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Category", style: AppTextStyle.semiBold16),
          SizedBox(height: 4.h), // مسافة بسيطة
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
            decoration: BoxDecoration(
              color: const Color(0xff2D2D2D),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomCategoryComponents(itemModel: items[0]),
                  ),

                  Container(color: AppColors.gray, width: 1),

                  Expanded(
                    child: CustomCategoryComponents(itemModel: items[1]),
                  ),

                  Container(color: AppColors.gray, width: 1),

                  Expanded(
                    child: CustomCategoryComponents(itemModel: items[2]),
                  ),

                  Container(color: AppColors.gray, width: 1),

                  // العنصر الرابع
                  Expanded(
                    child: CustomCategoryComponents(itemModel: items[3]),
                  ),

                  Container(color: AppColors.gray, width: 1),

                  Expanded(
                    child: CustomCategoryComponents(itemModel: items[4]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCategoryComponents extends StatelessWidget {
  const CustomCategoryComponents({super.key, required this.itemModel});
  final CategoryItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(itemModel.imagePath),
        SizedBox(height: 6),
        Text(itemModel.title, style: AppTextStyle.regular12),
      ],
    );
  }
}

class CategoryItemModel {
  final String title;
  final String imagePath;

  CategoryItemModel({required this.title, required this.imagePath});
}
