import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
          );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
     
    );
  }
}
