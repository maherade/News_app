import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(color: Colors.green),
    primaryColor: Colors.green,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18),
          topLeft: Radius.circular(18),
        ),
      ),
    ),
  );
}
