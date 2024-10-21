import 'package:flutter/material.dart';
import 'package:urikkiri_beta/constants/sizes.dart';
import 'package:urikkiri_beta/features/splash_screen.dart';

void main() {
  runApp(const UrikkiriApp());
}

class UrikkiriApp extends StatelessWidget {
  const UrikkiriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Urikkiri',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xFF5B97E7),
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Sizes.size12,
              ),
              borderSide: const BorderSide(
                color: Color(0xFF5B97E7),
                width: Sizes.size1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF5B97E7),
              ),
              borderRadius: BorderRadius.circular(Sizes.size12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: Sizes.size52,
              fontWeight: FontWeight.w600,
            ),
            titleSmall: TextStyle(
              fontSize: Sizes.size18,
            ),
            labelMedium: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF323232),
            ),
            bodyMedium: TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
