import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/sizes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
