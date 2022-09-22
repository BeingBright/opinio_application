import 'package:flutter/material.dart';

ThemeData getTheme(Brightness brightness) {
  return ThemeData(
      brightness: brightness,
      primarySwatch: Colors.red,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.red,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.red,
        size: 25,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          enableFeedback: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        splashColor: Colors.red,
        iconSize: 25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: BorderRadius.circular(0),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
        gapPadding: 16,
        borderRadius: BorderRadius.circular(0),
      )));
}
