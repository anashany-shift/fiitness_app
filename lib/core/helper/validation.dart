import 'package:flutter/widgets.dart';

abstract class Validation {
  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return "This field Empty";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\ninclude upper, lower, number, and special character';
    }

    return null;
  }

  static String? validateConfirmedPassword(String? value,TextEditingController passwordController) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;

  }

  static String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return "Code is required";
    }

    return null;
  }
}
