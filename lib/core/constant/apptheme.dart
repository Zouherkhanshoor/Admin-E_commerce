import 'package:flutter/material.dart';
import 'package:test_app/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(), backgroundColor: AppColor.primarycolor),
  appBarTheme: const AppBarTheme(
      color: AppColor.primarycolor,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black)),
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
    bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(), backgroundColor: AppColor.primarycolor),
  appBarTheme: const AppBarTheme(color: AppColor.primarycolor),
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
    bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 15),
  ),
  primarySwatch: Colors.blue,
);
