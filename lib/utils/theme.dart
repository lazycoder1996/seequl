import 'package:flutter/material.dart';
import 'package:seequl/utils/fonts.dart';

ThemeData customTheme() {
  return ThemeData(
    fontFamily: Fonts.familyName,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      titleTextStyle: Fonts.robotoLight.copyWith(
        color: Colors.black,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
    ),
  );
}
