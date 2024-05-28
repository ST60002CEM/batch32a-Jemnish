import 'package:flutter/material.dart';

ThemeData getApplicationTheme(bool isDark) {
  return ThemeData(
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: Colors.black,
            )
          : const ColorScheme.light(
              primary: Color.fromARGB(255, 17, 119, 20),
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
      fontFamily: 'Poppins',
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: const Color.fromARGB(255, 102, 200, 105),
      )));
}
