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
          primaryColorDark: const Color(0xFF323232),
          primaryColorLight: Colors.grey.shade400,
          disabledColor: Colors.grey.shade200,
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Color(0xFF5B97E7),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.size12),
              borderSide: const BorderSide(
                  color: Color(0xFF5B97E7), width: Sizes.size3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.size12),
              borderSide: const BorderSide(color: Color(0xFF5B97E7)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.size12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.size12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: Sizes.size52,
              fontWeight: FontWeight.w600,
            ),
            titleSmall: TextStyle(
              fontSize: Sizes.size16,
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
