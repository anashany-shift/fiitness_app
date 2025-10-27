import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/l10n/translation/app_localizations.dart';
import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_routes.dart';

void main() {

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    builder: (context, child) {
     return  MaterialApp(
      debugShowCheckedModeBanner: false,
          title: 'Fitness App',
          theme: AppTheme.lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale("en"),
            onGenerateRoute: AppRoutes.generateRoute,
             initialRoute:Routes.splash,
        );
    },
    );
  }
}
