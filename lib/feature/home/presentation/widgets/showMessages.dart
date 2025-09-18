import 'package:flutter/material.dart';

Widget showMessages(BuildContext context, String message) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 3,
    child: Center(
      child: SingleChildScrollView(
        child: Text(
          message,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
