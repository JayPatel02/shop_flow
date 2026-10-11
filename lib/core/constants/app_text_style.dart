import 'package:flutter/material.dart';

import '../enums/app_font_weight.dart';


class AppTextStyle {
  static const _fontFamily = "Inter";

  static FontWeight _getFontWeight(AppFontWeight weight) {
    switch (weight) {
      case AppFontWeight.thin:
        return FontWeight.w200;
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.semiBold:
        return FontWeight.w600;
      case AppFontWeight.bold:
        return FontWeight.w700;
      case AppFontWeight.extraBold:
        return FontWeight.w800;
    }
  }

  static TextStyle style({
    double fontSize = 14,
    Color color = Colors.black,
    AppFontWeight fontWeight = AppFontWeight.regular,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: _getFontWeight(fontWeight),
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration
    );
  }
}
