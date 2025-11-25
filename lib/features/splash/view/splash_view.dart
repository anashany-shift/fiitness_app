import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/helper/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/app_assets.dart';
import 'package:fitness_app/core/routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));

    bool first = await TokenStorage.isFirstLaunch();

    if (first) {
      await TokenStorage.setFirstLaunchDone();
      _goTo(Routes.onBoarding);
      return;
    }

    bool hasToken = await TokenStorage.hasToken();

    if (hasToken) {
      _goTo(Routes.mainLayout);
    } else {
      _goTo(Routes.login);
    }
  }

  void _goTo(String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZoomIn(
          duration: const Duration(seconds: 2),
          child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
