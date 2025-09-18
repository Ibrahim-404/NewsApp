import 'package:flutter/material.dart';

import 'const_color.dart';

class AppStyle {
  static TextStyle mainTitle = TextStyle(
    color: ConstColor.AppTitleSplashScreenColor,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );
  static TextStyle newsTitle = TextStyle(
    color: ConstColor.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle InnerNewsTitle = TextStyle(
    color: ConstColor.primaryColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static TextStyle authorStyle = TextStyle(
    color: ConstColor.secondaryColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle content = TextStyle(
    color: ConstColor.secondaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
