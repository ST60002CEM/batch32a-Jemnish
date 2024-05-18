import 'package:final_assignment/screen/splash_screens/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // themes
      home: SplashScreen(),
    );
  }
}
