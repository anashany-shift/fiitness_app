import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/auth/login/view/login_view.dart';
import 'package:fitness_app/features/auth/sign_up/view/sign_up_view.dart';
import 'package:fitness_app/features/exercise/view/exercise_view.dart';
import 'package:fitness_app/features/food_details/view/food_details_view.dart';
import 'package:fitness_app/features/food_recomndation_category/view/food_recomendation_category_view.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit.dart';
import 'package:fitness_app/features/main_layout/explore/view_model/cubit/explore_cubit_event.dart';
import 'package:fitness_app/features/main_layout/main_layout.dart';
import 'package:fitness_app/features/main_layout/workout/view_model/cubit/workout_cubit.dart';
import 'package:fitness_app/features/main_layout/workout/view_model/cubit/workout_cubit_event.dart';
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
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.mainLayout:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt.get<ExploreCubit>()..doIntent(ExploreGetAllData()),
              ),
              BlocProvider(
                create: (context) =>
                    getIt.get<WorkoutCubit>()..doIntent(WorkoutGetAllData()),
              ),
            ],
            child: const MainLayout(),
          ),
        );
      case Routes.exercise:
        final String primeMoveId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ExerciseView(primeMoveId: primeMoveId),
        );
      case Routes.foodRecomendationCategory:
        final String categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>
              FoodRecomendationCategoryView(categoryName: categoryName),
        );
      case Routes.foodDetails:
      final String mealId=settings.arguments as String;
        return MaterialPageRoute(builder: (_) => FoodDetailsView(mealId: mealId,));

      default:
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }
}
