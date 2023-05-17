import 'package:flutter/material.dart';

class CustomAppTheme {
  static const Color actionColor = Colors.red;
  static const Color neutralColor = Color.fromARGB(255, 255, 203, 107);

  static BorderRadius minBorderRadius = BorderRadius.circular(10);

  static const bigText = TextStyle(color: Colors.white, fontSize: 14);
  static const lowerText = TextStyle(color: Colors.white, fontSize: 12);

  static ThemeData theme(BuildContext context) => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          elevation: 0,
        ),
      );
}
