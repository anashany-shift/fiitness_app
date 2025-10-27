import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeInOut(size: 30, color: AppColors.mainColorL[20]),
    );
  }
}
