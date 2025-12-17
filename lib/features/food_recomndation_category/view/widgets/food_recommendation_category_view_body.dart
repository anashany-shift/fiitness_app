import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/features/food_recomndation_category/view_model/cubit/food_recommendation_cubit.dart';
import 'package:fitness_app/features/food_recomndation_category/view_model/cubit/food_recommendation_event.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_image_container.dart';
import 'package:fitness_app/features/main_layout/explore/view/widget/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FoodRecommendationCategoryViewBody extends StatelessWidget {
  final String currentCategoryName;

  const FoodRecommendationCategoryViewBody({
    super.key,
    required this.currentCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlurredBackground(
      imagePath: AppAssets.homeBg,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      AppAssets.backIcon,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),

                const Spacer(),

                Text("Food Recommendation", style: AppTextStyle.semiBold24),

                const Spacer(),

                SizedBox(width: 24.w, height: 24.h),
              ],
            ),
            SizedBox(height: 24.h),

            Expanded(
              child:
                  BlocBuilder<FoodRecommendationCubit, FoodRecommendationState>(
                    builder: (context, state) {
                      final categories = state.foodCategoryEntity?.data ?? [];
                      final meals = state.mealsByCategoryEntity?.data ?? [];

                      return Column(
                        children: [
                          if (state.foodCategoryEntity?.isLoading == true)
                            const Center(child: LinearProgressIndicator())
                          else
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              clipBehavior: Clip.none,
                              child: Row(
                                children: List.generate(categories.length, (
                                  index,
                                ) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8.0.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<FoodRecommendationCubit>()
                                            .doIntent(
                                              ChangeCategoryTabEvent(
                                                index: index,
                                                categoryName:
                                                    categories[index].name,
                                              ),
                                            );
                                      },
                                      child: TabBarItem(
                                        isSelected:
                                            state.selectedTabIndex == index,
                                        title: categories[index].name,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),

                          SizedBox(height: 24.h),

                          /// Grid (Meals)
                          if (state.mealsByCategoryEntity?.isLoading == true)
                            const Expanded(
                              child: Center(child: CircularProgressIndicator()),
                            )
                          else if (state.mealsByCategoryEntity?.errorMessage !=
                              null)
                            Expanded(
                              child: Center(
                                child: Text(
                                  state.mealsByCategoryEntity!.errorMessage!,
                                ),
                              ),
                            )
                          else
                            Expanded(
                              child: GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: meals.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 163 / 160,
                                      mainAxisSpacing: 18.h,
                                      crossAxisSpacing: 18.w,
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      final mealdId = meals[index].mealId;
                                       Navigator.pushNamed(context, Routes.foodDetails,arguments: mealdId);
                                    },
                                    child: CustomImageContainer(
                                      imagePath: meals[index].mealImage ?? "",
                                      title: meals[index].mealTitle ?? "",
                                      width: 163,
                                      height: 160,
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
