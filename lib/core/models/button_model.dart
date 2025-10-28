import 'package:flutter/material.dart';

class ButtonModel {
  final String text;
  final void Function() onPressed;
  final double? width, height;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final TextStyle? textStyle;

  ButtonModel({
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 30.0,
    this.textStyle,
  });
}
