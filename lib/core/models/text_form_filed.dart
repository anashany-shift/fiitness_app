import 'package:flutter/material.dart';

class TextFormFieldModel {
  final String hint;
  final Widget? suffix;
  final Widget? preSuffix;
  final TextInputType? keyboardType;
  bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? border;
  final TextEditingController? controller;
  final bool readOnly;

  TextFormFieldModel({
    this.preSuffix, 
    this.suffixIcon,
    this.suffix,
    this.controller,
    this.border,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.readOnly=false
  });
}
