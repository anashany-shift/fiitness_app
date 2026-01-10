import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      buildWhen: (previous, current) => 
          previous.loggedUserDataEntity != current.loggedUserDataEntity,
      builder: (context, state) {
        
        final userData = state.loggedUserDataEntity?.data;
        
        final String userName = userData?.firstName ?? "";
        final String userImage = userData?.photo ?? AppAssets.perosn;

        return ListTile(
          trailing: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(

                image: (userData?.photo != null && userData!.photo!.isNotEmpty)
                    ?  CachedNetworkImageProvider(userImage)
                    : AssetImage(AppAssets.perosn), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
             "Hello, $userName", 
             style: AppTextStyle.medium16
          ),
          subtitle: Text('Let’s start your day', style: AppTextStyle.bold20),
        );
      },
    );
  }
}
