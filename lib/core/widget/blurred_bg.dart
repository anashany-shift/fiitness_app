import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  final String imagePath;
  final double blurX;
  final double blurY;
  final double overlayOpacity;
  final Widget? child;

  const BlurredBackground({
    super.key,
    required this.imagePath,
    this.blurX = 12.5,
    this.blurY = 12.5,
    this.overlayOpacity = 0.2,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),

        // 🌫️ Blur layer
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
          child: Container(
            color: Colors.black.withOpacity(overlayOpacity),
          ),
        ),

        if (child != null) child!,
      ],
    );
  }
}
