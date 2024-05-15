import 'package:final_assignment/screen/splash_screens/frist_onboard_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FirstSplashScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to KhetiPati',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 250, // adjust the width as needed
              height: 300, // adjust the height as needed
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
            const Text(
              'Version 1.0.0',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}