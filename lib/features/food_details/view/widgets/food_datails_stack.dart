import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class FoodDetailsStack extends StatelessWidget {
  const FoodDetailsStack({
    super.key,
    required this.info,
    required this.title,
    required this.desc,
    required this.imageCover, this.onPlayTap,
  });
  final List<String> info;
  final String title, desc, imageCover;
  final void Function()? onPlayTap;

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

            image: DecorationImage(
              image: NetworkImage(imageCover),
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
              Text(title, style: AppTextStyle.medium24),
              SizedBox(
                height: 100.h,
                child: SingleChildScrollView(
                  child: ReadMoreText(
                    desc,
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Read more',
                    trimExpandedText: ' Read less',
                    style: AppTextStyle.regular16,
                    moreStyle: AppTextStyle.regular16.copyWith(
                      color: AppColors.mainColorL,
                      fontWeight: FontWeight.w600,
                    ),
                    lessStyle: AppTextStyle.regular16.copyWith(
                      color: AppColors.mainColorL,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.h),
              Row(
                children:[
                  Text("Youtue Link",style: AppTextStyle.bold20.copyWith(color: AppColors.mainColorL),),
                  SizedBox(width: 10,),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: GestureDetector(
                      onTap: onPlayTap,
                      child: SvgPicture.asset(AppAssets.youtube),
                    ),
                  )
                ]
              ),
            ],
          ),
        ),
      ],
    );
  }
}
