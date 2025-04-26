import 'package:flutter/material.dart';

import 'colors.dart';

class MThemeData {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      secondaryHeaderColor: primaryColor,
      hintColor: primaryColor,
      focusColor: primaryColor,
      hoverColor: primaryColor,
      highlightColor: primaryColor,
      unselectedWidgetColor: primaryColor,
      cardColor: primary3Color,
      cardTheme: const CardTheme(
        surfaceTintColor: primary3Color,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
        selectionColor: primaryColor.withOpacity(0.3),
        selectionHandleColor: primaryColor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        accentColor: primaryColor,
        backgroundColor: primary3Color,
      ).copyWith(
        primary: primaryColor,
        secondary: primaryColor,
        onPrimary: primary3Color,
        onSecondary: primary3Color,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: primary3Color,
        titleTextStyle: TextStyle(
            color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        contentTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
