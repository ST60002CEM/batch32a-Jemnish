import 'package:final_assignment/screen/splash_screens/third_onboard_screen.dart';
import 'package:flutter/material.dart';

class SecondOnboardScreen extends StatelessWidget {
  const SecondOnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_2.jpg',
              width: 250,
              height: 350,
            ),
            const Text(
              'Welcome to KhetiPati!!!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const Text(
              '"Empowering Nepali Farmers, One Click at a Time!"',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThirdOnboardScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16), // Adjust padding as per your need
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust border radius as per your need
                ),
                backgroundColor: const Color.fromARGB(
                    255, 102, 200, 105), // Change background color
              ),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
