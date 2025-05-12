import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColor.primaryColor,
        fontFamily: "Cairo"),
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColor.background,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    headlineSmall: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodySmall: TextStyle(
        height: 2,
        color: AppColor.gray,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    bodyMedium: TextStyle(height: 2, color: AppColor.gray, fontSize: 14),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    headlineSmall: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodySmall: TextStyle(
        height: 2,
        color: AppColor.gray,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    bodyMedium: TextStyle(height: 2, color: AppColor.gray, fontSize: 14),
  ),
);
