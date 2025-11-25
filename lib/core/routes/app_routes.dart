import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/auth/login/view/login_view.dart';
import 'package:fitness_app/features/auth/login/view_model/cubit/login_cubit.dart';
import 'package:fitness_app/features/auth/sign_up/view/sign_up_view.dart';
import 'package:fitness_app/features/main_layout/main_layout.dart';
import 'package:fitness_app/features/on_boarding/view/on_boarding_view.dart';
import 'package:fitness_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes.dart';

abstract class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: const LoginView()));
            case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());
         case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());


      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
