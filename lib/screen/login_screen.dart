import 'package:final_assignment/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 228, 212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png', // Change to your app logo image path
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Implement forgot password functionality
                  },
                  child: const Text('Forgot Password?'),
                ),
                const SizedBox(width: 50),
                TextButton(
                  onPressed: () {
                    // Implement registration functionality
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                // Implement login with Google functionality
              },
              icon: SvgPicture.asset(
                'assets/icons/google.svg', // Change to your Google logo image path
                width: 24,
                height: 24,
              ),
              label: const Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
