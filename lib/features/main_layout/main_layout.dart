import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/features/main_layout/explore/view/explore_view.dart';
import 'package:fitness_app/features/main_layout/smart_couch/view/smart_couch_view.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'profile/view/Profile_view.dart';
import 'workout/view/workout_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {


  int currentIndex = 0;
  final PageController _pageController = PageController();
  bool isBottomNavVisible = true;
  final ValueNotifier<int> workpoutIndexNotifier = ValueNotifier(0);
  final ValueNotifier<String> workpoutGroupId = ValueNotifier("");






  void onExploreTapBarSelected(int index, String groupId) {
    setState(() {
      currentIndex = 2;
      isBottomNavVisible = true;
    });
    workpoutIndexNotifier.value = index;
    workpoutGroupId.value = groupId;
    _pageController.jumpToPage(2);
  }




  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      ExploreView(onTapBar: (index, id) => onExploreTapBarSelected(index, id)),
      SmartCouchview(),
      WorkoutView(
        indexNotifier: workpoutIndexNotifier,
        idNotifier: workpoutGroupId,
      ),
      ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis == Axis.vertical) {
              if (notification.direction == ScrollDirection.forward) {
                if (!isBottomNavVisible) {
                  setState(() => isBottomNavVisible = true);
                }
              } else if (notification.direction == ScrollDirection.reverse) {
                if (isBottomNavVisible) {
                  setState(() => isBottomNavVisible = false);
                }
              }
            }
            return true;
          },
          child: BlurredBackground(
            imagePath: AppAssets.homeBg,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: pages,
            ),
          ),
        ),

        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          height: isBottomNavVisible ? 130 : 0.0,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: ClipRRect(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0.w,
                  vertical: 24.h,
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: const Color(0xff242424).withOpacity(0.8),
                  ),

                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: BottomNavigationBar(
                      showUnselectedLabels: false,

                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      currentIndex: currentIndex,
                      onTap: (value) {
                        setState(() {
                          currentIndex = value;
                          isBottomNavVisible = true;
                        });
                        _pageController.jumpToPage(value);
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AppAssets.explore,

                            color: currentIndex == 0
                                ? AppColors.mainColorL
                                : Colors.white,
                          ),
                          label: 'Explore',
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AppAssets.smartCouch,
                            height: 24.h,
                            width: 24.w,
                            color: currentIndex == 1
                                ? AppColors.mainColorL
                                : Colors.white,
                          ),
                          label: 'Smart Couch',
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AppAssets.workout,
                            height: 24.h,
                            width: 24.w,
                            color: currentIndex == 2
                                ? AppColors.mainColorL
                                : Colors.white,
                          ),
                          label: 'workout',
                        ),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                            AppAssets.profile,
                            height: 24.h,
                            width: 24.w,
                            color: currentIndex == 3
                                ? AppColors.mainColorL
                                : Colors.white,
                          ),
                          label: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
