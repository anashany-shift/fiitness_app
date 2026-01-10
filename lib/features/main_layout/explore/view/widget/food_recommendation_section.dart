import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/recommendation_item.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodRecommendationSection extends StatelessWidget {
  const FoodRecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommendation For you", style: AppTextStyle.semiBold16),
              Text(
                "See All",
                style: AppTextStyle.regular14.copyWith(
                  color: AppColors.mainColorL,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              if (state.foodCategoryEntity?.isLoading == true) {
                return Center(child: CircularProgressIndicator());
              }
              if (state.foodCategoryEntity?.errorMessage != null) {
                return Text(state.foodCategoryEntity?.errorMessage ?? "");
              }
              if (state.foodCategoryEntity?.data != null) {
                final foodCategories = state.foodCategoryEntity?.data;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(foodCategories?.length ?? 0, (
                      index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            final categoryName = foodCategories?[index]
                                .name; 
                            if (categoryName != null) {
                              Navigator.pushNamed(
                                context,
                                Routes.foodRecomendationCategory,
                                arguments: categoryName, 
                              );
                            }
                          },
                          child: RecommendationItem(
                            title: foodCategories?[index].name ?? "",
                            imagePath: foodCategories?[index].thumbnail ?? "",
                          ),
                        ),
                      );
                    }),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
