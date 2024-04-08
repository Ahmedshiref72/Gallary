import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return lightTheme;
}

ThemeData lightTheme = ThemeData(
  primaryColor: ColorManager.primary,
  fontFamily: FontConstants.fontFamilySegoe,
  textTheme: TextTheme(
    // For titleLarge bold texts
    titleLarge: TextStyle(
      fontSize: FontSize.s50,
      color: ColorManager.primary,
      fontWeight: FontWeightManager.bold,
    ),
    // For titleMedium bold texts
    titleMedium: TextStyle(
      fontSize: FontSize.s30,
      color: ColorManager.primary,
      fontWeight: FontWeightManager.bold,
    ),
    // For subtitle lightGrey texts
    titleSmall: TextStyle(
      fontSize: FontSize.s16,
      color: ColorManager.lightGrey,
    ),
    labelLarge: TextStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s32, fontWeight: FontWeightManager.semiBold),
    // For small texts,
    // For text buttons
    labelMedium: TextStyle(
        color: ColorManager.primary,
        fontSize: FontSize.s18, fontWeight: FontWeightManager.semiBold),
    // For small texts
    displaySmall: const TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.semiBold,
    ),
    // For hint texts
    displayMedium: const TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.semiBold,
    ),
    // For text form fields input
    displayLarge: const TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.semiBold,
    ),
    // For description text.
    headlineSmall: TextStyle(
      fontSize: FontSize.s14,
      color: ColorManager.darkGrey,
    ),
    // For buttons label
    headlineMedium: const TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.bold,
      color: Colors.white,
    ),
    // For appbar title
    headlineLarge: const TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.medium,
    ),
  ),
  // scrolling color.
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: ColorManager.primary,
  ),
);
