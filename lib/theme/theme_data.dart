import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.grey[100],
      fontFamily: 'Poppins Regular',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: const Color.fromARGB(255, 102, 200, 105),
        ),
      ));
}
