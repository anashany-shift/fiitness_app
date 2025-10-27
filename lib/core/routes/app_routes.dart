
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
      // case Routes.signUp:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignUpView(),
      //   );
   


      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
