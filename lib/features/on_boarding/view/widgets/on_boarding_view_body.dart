import 'package:fitness_app/core/models/button_model.dart';
import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:fitness_app/core/widget/blurred_bg.dart';
import 'package:fitness_app/core/widget/blurred_container.dart';
import 'package:fitness_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'on_boarding_page_model.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController();

  final List<OnBoardingPageModel> pages = [
    OnBoardingPageModel(
      imagePath: AppAssets.onBoarding1,
      title: "The price of excellence\n is discipline",
      subtitle:
          "Lorem ipsum dolor sit amet consectetur. Eu urna\n ut gravida quis id pretium purus. Mauris massa ",
    ),
    OnBoardingPageModel(
      imagePath: AppAssets.onBoarding2,
      title: "Fitness has never been so\n much fun",
      subtitle:
          "Suspendisse potenti. Nullam non metus nec eros\n commodo iaculis. Sed non justo ac felis.",
    ),
    OnBoardingPageModel(
      imagePath: AppAssets.onBoarding3,
      title: "NO MORE EXCUSES \nDo It Now",
      subtitle:
          "Donec vitae sapien ut libero venenatis faucibus.\n Nullam quis ante. Etiam sit amet orci.",
    ),
  ];

  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          _currentPageIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildButtons(int index) {
    switch (index) {
      case 0:
        return CustomButton(
          key: const ValueKey('page_0_buttons'),
          buttonModel: ButtonModel(
            text: "Next",
            onPressed: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            width: double.infinity,
          ),
        );
      case 1:
        return Row(
          key: const ValueKey('page_1_buttons'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              buttonModel: ButtonModel(
                backgroundColor: Colors.transparent,
                text: "Back",
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                width: 80,
              ),
            ),
            CustomButton(
              buttonModel: ButtonModel(
                text: "Next",
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                width: 80,
              ),
            ),
          ],
        );
      case 2:
        return Row(
          key: const ValueKey('page_2_buttons'),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              buttonModel: ButtonModel(
                backgroundColor: Colors.transparent,
                text: "Back",
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                width: 80,
              ),
            ),
            CustomButton(
              buttonModel: ButtonModel(
                text: "Do It",
                onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context,Routes.login, (route) => false,);
                },
                width: 80,
              ),
            ),
          ],
        );
      default:
        return const SizedBox.shrink(key: ValueKey('default_buttons'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlurredBackground(
      imagePath: AppAssets.bgOnBoradnig,
      child: Stack(
      
        children: [
         
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Center(
                child: Transform.translate(
                  offset: const Offset(0, -90),
                  child: Image.asset(pages[index].imagePath),
                ),
              );
            },
          ),
           Visibility(
      visible: _currentPageIndex == 0 || _currentPageIndex == 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, top: 40),
        child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.login,
                (route) => false,
              );
            },
            child:  Text('Skip',style: AppTextStyle.regular14,), // simple unstyled text
          ),
        ),
      ),
    ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlurredContainer(
              padding: const EdgeInsets.only(top: 31.5, right: 16, left: 16),
              width: double.infinity,
              height: 275,
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                    child: Text(
                      key: ValueKey<String>(pages[_currentPageIndex].title),
                      pages[_currentPageIndex].title,
                      style: AppTextStyle.extraBold24,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                    child: Text(
                      key: ValueKey<String>(pages[_currentPageIndex].subtitle),
                      pages[_currentPageIndex].subtitle,
                      style: AppTextStyle.regular16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  DotsIndicator(
                    dotsCount: pages.length,
                    position: _currentPageIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: AppColors.mainColorL,
                      color: const Color(0xFFD9D9D9),
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  _buildButtons(_currentPageIndex),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
