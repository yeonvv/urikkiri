import 'package:flutter/material.dart';
import 'package:urikkiri_beta/features/splash_screen.dart';

void main() {
  runApp(const UrikkiriApp());
}

class UrikkiriApp extends StatelessWidget {
  const UrikkiriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urikkiri',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF5B97E7),
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
      ),
      home: const SplashScreen(),
    );
  }
}
