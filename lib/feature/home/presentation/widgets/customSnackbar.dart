import 'package:flutter/material.dart';

class CustomSnackbar {
  static SnackBar failureSnackbar(String message) {
    return SnackBar(
      duration: Duration(seconds: 3),
      content: Text(message),
      backgroundColor: Colors.red,
    );
  }
  static SnackBar successSnackbar(String message) {
    return SnackBar(
      duration: Duration(seconds: 3),
      content: Text(message),
      backgroundColor: Colors.green,
    );
  }
}
