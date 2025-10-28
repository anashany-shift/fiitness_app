
import 'package:fitness_app/features/on_boarding/view/on_boarding_view.dart';
import 'package:fitness_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
   


      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
