import 'package:flutter/material.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/features/auth/presentation/login_selection_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginSelectionScreen(),
          ),
        );
      },
    );
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size52,
        ),
        child: Center(
          child: Image.asset(
            "assets/images/urikkiri_full_logo.png",
          ),
        ),
      ),
    );
  }
}
