import 'package:flutter/material.dart';
import 'package:my_flutter_template_v2/utils/colors/m_colors.dart';

ThemeData buildLightTheme() => ThemeData.light().copyWith(
  cardColor: Colors.white,
  scaffoldBackgroundColor: AppColors.defaultWhite,
  brightness: Brightness.light,
  iconTheme: IconThemeData(
    color: AppColors.defaultBlack,
  ),
  cardTheme: const CardThemeData(
    color: Colors.white,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.primaryColor,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: Colors.black,
    ),
  ),
  dividerColor: AppColors.defaultBlack,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    shadowColor: Colors.transparent,
    backgroundColor: AppColors.defaultWhite,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith(
            (states) => TextStyle(
          color: AppColors.defaultBlack,
        ),
      ),
    ),
  ),
  textTheme: Typography.blackCupertino,
);

ThemeData buildDarkTheme() => ThemeData.dark().copyWith(
  cardColor: Colors.grey[850],
  scaffoldBackgroundColor: AppColors.darkColor,
  dividerColor: AppColors.defaultWhite,
  iconTheme: IconThemeData(
    color: AppColors.defaultWhite,
  ),
  cardTheme: CardThemeData(
    color: AppColors.cardColor,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: Colors.grey[900],
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: Colors.white,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
          (states) => Colors.grey[400],
    ),
    trackColor: WidgetStateProperty.resolveWith(
          (states) => Colors.white,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    color: Colors.grey[900],
    iconTheme: IconThemeData(
      color: Colors.grey[400],
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.resolveWith(
            (states) => TextStyle(
          color: AppColors.defaultBlack,
        ),
      ),
    ),
  ),
  textTheme: Typography.whiteCupertino,
);