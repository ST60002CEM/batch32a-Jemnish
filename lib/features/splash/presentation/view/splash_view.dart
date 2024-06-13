import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/features/splash/presentation/viewmodel/splash_view_model.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

//  Make the splash screen consumer stateless to use initState
class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    ref.read(splashViewModelProvider.notifier).openLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1FCF9),
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
