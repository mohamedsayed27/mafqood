import 'package:flutter/material.dart';
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class AppColorsLightTheme{
  static const primaryColor = Color(0xff89CFF0);
  static const whitColor = Color(0xffFFFFFF);
  static const whitTextColor = Color(0xffFFFFFF);
  static const blueTextColor = Color(0xff89CFF0);
  static const greyTextColor = Color(0xffAAAAAA);
  static const greyOtpFieldColor = Color(0xffD9D9D9);
  static const greySearchTextFilledColor =  Color(0xffD9D9D9);
  static const greyColorContainers = Color(0xffF0F0F0);
  static const authTextFieldFillColor =  Color(0xffF9F9F9);
  static const bottomNavBarGreyIconColor =  Color(0xff777777);
  static Color pinFieldColor =  const Color(0xffD9D9D9).withOpacity(0.6);
}