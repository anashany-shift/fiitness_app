// import 'dart:ui';

// import 'package:fitness_app/core/utils/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RecommendationItem extends StatelessWidget {
//   const RecommendationItem({
//     super.key,
//     required this.title,
//     required this.imagePath,
//   });
//   final String title, imagePath;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 104.h,
//       width: 104.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(image:ImageCache (imagePath), fit: BoxFit.cover),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//               child: Container(
//                 height: 30.h,
//                 width: 104.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Color(0xff242424).withOpacity(0.5),
//                 ),
//                 child: Center(
//                   child: Text(title, style: AppTextStyle.regular12),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
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
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            /// ⭐ Cached Image
            CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
              width: 104.w,
              height: 104.h,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade300,
                child: Icon(Icons.broken_image, size: 40),
              ),
            ),

            /// ⭐ Bottom Blur Label
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                 20
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 30.h,
                    width: double.infinity,
                    color: const Color(0xff242424).withOpacity(0.5),
                    child: Center(
                      child: Text(
                        title,
                        style: AppTextStyle.regular12,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

