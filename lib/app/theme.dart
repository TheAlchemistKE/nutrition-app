import 'package:flutter/material.dart';
import 'package:nutrinowapp/constants/colors.dart';

ThemeData appTheme() => ThemeData(
    primaryColor: themeColor,
    highlightColor: themeColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: themeColor,
          primary: themeColor,
        ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(themeColor),
      fillColor: MaterialStateProperty.all(Colors.white),
      side: BorderSide(color: Colors.grey),
    ));
