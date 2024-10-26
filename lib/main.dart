import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          textTheme: TextTheme(
            displayLarge: GoogleFonts.notoSansKr(
                fontSize: 60, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            displayMedium: GoogleFonts.notoSansKr(
                fontSize: 60, fontWeight: FontWeight.w800, letterSpacing: -0.5),
            displaySmall: GoogleFonts.notoSansKr(
                fontSize: 48, fontWeight: FontWeight.w800),
            headlineMedium: GoogleFonts.notoSansKr(
                fontSize: 34, fontWeight: FontWeight.w600, letterSpacing: 0.25),
            headlineSmall: GoogleFonts.notoSansKr(
                fontSize: 26, fontWeight: FontWeight.w500),
            titleLarge: GoogleFonts.notoSansKr(
                fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 0.15),
            titleMedium: GoogleFonts.notoSansKr(
                fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15),
            titleSmall: GoogleFonts.notoSansKr(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyLarge: GoogleFonts.notoSansKr(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5),
            bodyMedium: GoogleFonts.notoSansKr(
                fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.25),
            bodySmall: GoogleFonts.notoSansKr(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            labelLarge: GoogleFonts.notoSansKr(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.25),
            labelSmall: GoogleFonts.notoSansKr(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
