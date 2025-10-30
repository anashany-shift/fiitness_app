
import 'package:fitness_app/core/constants/const_keys.dart';
import 'package:fitness_app/core/utils/app_colors.dart';
import 'package:fitness_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backGroundL[10],
    fontFamily:"BalooThambi2",
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.mainColorL,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.mainColorL,
    ),
    
    // appBarTheme: AppBarTheme(
    //   backgroundColor:Colors.transparent,
    //   surfaceTintColor: Colors.transparent,
    //   elevation: 0,
    //   titleTextStyle: getTextStyle(
    //     fontSize: 20.sp,
    //     fontWeight: FontWeight.w800,
    //   ),
    //   iconTheme: IconThemeData(color: AppColors.black),
    // ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
  

      filled: false,
    
      hintStyle:AppTextStyle.regular12.copyWith(color: AppColors.lgihtGray),
      labelStyle: AppTextStyle.regular12.copyWith(color: AppColors.lgihtGray),
    
  

      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return getTextStyle(color: AppColors.red);
        }
        return getTextStyle(color: AppColors.lgihtGray);
      }),
      errorStyle: getTextStyle(color: AppColors.red),
      border: getOutlineInputBorder(color: AppColors.lgihtGray),
      focusedBorder: getOutlineInputBorder(color: AppColors.lgihtGray),
      enabledBorder: getOutlineInputBorder(color: AppColors.lgihtGray),
      errorBorder: getOutlineInputBorder(color: AppColors.red),
    
    ),
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.red,
        applyTextScaling: true,
      ),
      selectedItemColor: AppColors.red,
      unselectedItemColor: AppColors.gray,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.shifting,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding:EdgeInsetsGeometry.symmetric(vertical: 9,horizontal:16 ),
        backgroundColor: AppColors.mainColorL,
       // disabledBackgroundColor: AppColors.black[30],
        foregroundColor: AppColors.white,
        textStyle: getTextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800,color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide.none
        
      
        ),
      ),
    ),

    dialogTheme: DialogThemeData(
      titleTextStyle: getTextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: getTextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static InputBorder getOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: color, width: 1.w),
    );
  }

  static TextStyle getTextStyle({
    Color? color,
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color ?? AppColors.black,
      fontSize: fontSize ?? 14.sp,
      fontFamily: fontFamily ?? ConstKeys.balooThambi2Font,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
