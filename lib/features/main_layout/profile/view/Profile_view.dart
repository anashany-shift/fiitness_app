import 'dart:ui';

import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/custom_dialog.dart';
import 'package:fitness_app/features/main_layout/profile/view_model/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.logoutResponse?.data != null) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamedAndRemoveUntil(Routes.login, (route) => false);
        } else if (state.logoutResponse?.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.logoutResponse?.errorMessage ?? "Error occurred",
              ),
            ),
          );
          Navigator.pop(context);
        } else if (state.logoutResponse?.isLoading == true) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        AppAssets.backIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text("Profile", style: AppTextStyle.semiBold24),
                  const Spacer(),
                  SizedBox(width: 24.w, height: 24.h),
                ],
              ),

              SizedBox(height: 40.h),

              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  final userInfo = state.userInfoEntity?.data;
                  final imageUrl = userInfo?.photo;
                  final name = userInfo?.firstName ?? '';

                  return Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: imageUrl != null && imageUrl.isNotEmpty
                              ? DecorationImage(
                                  image: NetworkImage(imageUrl),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage(AppAssets.profile),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(name, style: AppTextStyle.semiBold24),
                    ],
                  );
                },
              ),

              SizedBox(height: 32.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff242424).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      children: [
                        _profileItem(
                          icon: AppAssets.profile,
                          title: "Edit Profile",
                        ),
                        _divider(),
                        _profileItem(
                          icon: AppAssets.changePassword,
                          title: "Change Password",
                        ),
                        _divider(),
                        _profileItem(
                          icon: AppAssets.selectLanguage,
                          title: "Select Language (English)",
                        ),
                        _divider(),
                        _profileItem(
                          icon: AppAssets.security,
                          title: "Security",
                        ),
                        _divider(),
                        _profileItem(
                          icon: AppAssets.privacyPlicy,
                          title: "Privacy Policy",
                        ),
                        _divider(),
                        _profileItem(icon: AppAssets.help, title: "Help"),
                        _divider(),
                        _profileItem(
                          icon: AppAssets.logout,
                          title: "Logout",
                          titleColor: AppColors.mainColorL,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => CustomDialog(
                                message: "Are you sure to logout?",
                                showTwoButtons: true,
                                onYes: () {
                                  cubit.logout();
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileItem({
    required String icon,
    required String title,
    Color? titleColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            SizedBox(height: 16.h, width: 16.w, child: SvgPicture.asset(icon)),
            SizedBox(width: 8.w),
            Text(
              title,
              style: AppTextStyle.semiBold14.copyWith(color: titleColor),
            ),
            const Spacer(),
            Transform.flip(
              flipX: true,
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.mainColorL,
                size: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(height: 0, color: AppColors.lgihtGray, thickness: 0.8);
  }
}
