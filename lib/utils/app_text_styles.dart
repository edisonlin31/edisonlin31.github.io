import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle regular(
      {double fontSize = 14, Color? color, TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle medium({double fontSize = 14, Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle bold(
      {double fontSize = 14, Color? color, List<Shadow>? shadows}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
      shadows: shadows,
    );
  }
}
