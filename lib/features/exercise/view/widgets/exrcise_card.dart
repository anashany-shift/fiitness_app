import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key, required this.title, required this.disc, required this.onPlayTap, required this.youtubeLink});
  final String title,disc;

  final VoidCallback onPlayTap; 
  final String youtubeLink;

  String getThumbnailUrl(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId == null) {
      return 'https://via.placeholder.com/150x88.png?text=No+Video';
    }
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = getThumbnailUrl(youtubeLink); // <--- جلب رابط الصورة
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        // height: 120.h,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: Color(0xff242424),
          borderRadius: BorderRadius.circular(20),
        ),

        child:  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            thumbnailUrl,
            width: 81.w,
            height: 88.h,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
               return Container(
                 width: 81.w,
                 height: 88.h,
                 color: Colors.grey[800],
                 child: const Center(
                   child: CircularProgressIndicator(color: Colors.deepOrange),
                 ),
               );
            },errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                width: 81.w,
                 height: 88.h,
                child: Placeholder());
            },
          ),
        ),
    
        SizedBox(width: 16.w),
    
        Expanded(
          child: Column(
          //  mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: .center,
            children: [
              /// Title
              Text(
                title,
                maxLines:3 ,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.medium18,
              ),
    
              //SizedBox(height: 8.h),
    
              Text(disc, style: AppTextStyle.regular14),
            ],
          ),
        ),
    
        SizedBox(width: 10.w),
    
        Container(
          width: 30.w,
          height: 30.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepOrange,
          ),
          child: GestureDetector(
            onTap: onPlayTap,
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        
      ],
    )
      ),
    );
  }
}
