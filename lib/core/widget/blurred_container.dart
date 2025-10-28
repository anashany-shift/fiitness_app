import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final double width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double blur;
  final double opacity;
  final Color color;
  final Widget? child;
  final Border? border;

  const BlurredContainer({
    super.key,
    required this.width,
     this.height,
    this.borderRadius = 50,
    this.padding = const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 24),
    this.blur = 34.6,
    this.opacity = 0.1,
    this.color = const Color(0xFF242424),
    this.child,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
       clipBehavior: Clip.hardEdge,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
           
         
          ),
          child: child,
        ),
      ),
    );
  }
}
