import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

ThemeData mainTheme(Locale locale) => ThemeData(
  fontFamily: Fonts().font,
  brightness: Brightness.light,
  scaffoldBackgroundColor: ThemeColors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: ThemeColors.white,
    iconTheme: const IconThemeData(color: ThemeColors.black),
    titleTextStyle: TextStyle(
      color: ThemeColors.black,
      fontFamily: Fonts().font,
    ),
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: ThemeColors.black),
    titleLarge: TextStyle(color: ThemeColors.black),
    bodyLarge: TextStyle(color: ThemeColors.black),
    bodyMedium: TextStyle(color: ThemeColors.black),
    labelLarge: TextStyle(
      color: ThemeColors.white,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(color: ThemeColors.primary),
  ),
  buttonTheme: const ButtonThemeData(buttonColor: ThemeColors.primary),
);
