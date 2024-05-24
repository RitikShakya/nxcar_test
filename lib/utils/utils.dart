import 'package:flutter/material.dart';

class ColorUtils {
  static const Color BRAND_COLOR = Color(0xFF41CBC3);
  static const Color ERROR_RED = Color(0xFFDF1111);
  static const Color BLACK_COLOR = Color(0xFF242424);
  static const Color BRAND_COLOR_LIGHT = Color(0xFFE0FFFA);
  static const Color GREY_TEXT = Color(0xFF585A5A);
  static const Color GREY_COLOR_PLACEHOLDER = Color(0xFFF7FAF8);

  static const Color GREY_BORDER = Color(0xFF6F7978);
}

class TextStyleUtils {
  static TextStyle textStyleHeader1 = TextStyle(
    fontSize: 22,
    color: ColorUtils.BRAND_COLOR,
    fontFamily: "NotoSans-Regular",
    letterSpacing: 0.5,
  );
  static TextStyle textStyleh28w600black = TextStyle(
    fontSize: 28,
    color: ColorUtils.BLACK_COLOR,
    fontWeight: FontWeight.w600,
    fontFamily: "NotoSans-Regular",
    letterSpacing: 0.5,
  );

  static TextStyle textStyleh24w400black = TextStyle(
    fontSize: 24,
    color: ColorUtils.BLACK_COLOR,
    fontWeight: FontWeight.w400,
    fontFamily: "NotoSans-Regular",
    letterSpacing: 0.5,
  );

  static TextStyle textStyleh14w400branc = TextStyle(
    fontSize: 14,
    color: ColorUtils.BRAND_COLOR,
    fontWeight: FontWeight.w400,
    fontFamily: "NotoSans-Regular",
    letterSpacing: 0.5,
  );

  static TextStyle textStyleh16w500black = TextStyle(
    fontSize: 16,
    color: ColorUtils.BLACK_COLOR,
    fontWeight: FontWeight.w500,
    fontFamily: "NotoSans-Regular",
    letterSpacing: 0.5,
  );
}
