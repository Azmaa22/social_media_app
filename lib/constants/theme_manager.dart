import 'package:flutter/material.dart';
import 'package:social_media_app/constants/colors_manager.dart';

class ThemeManager {
  static ThemeData darkTheme = ThemeData();
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.kPrimaryColor,
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: ColorManager.kOffWhiteColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.kOffWhiteColor,
      unselectedItemColor: ColorManager.kBlackColor,
      elevation: 20.0,
      backgroundColor: ColorManager.kPrimaryColor,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: ColorManager.kOffWhiteColor,
      ),
      subtitle1: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: ColorManager.kOffWhiteColor,
        height: 1.3,
      ),
    ),
    fontFamily: 'janna',
  );
}
