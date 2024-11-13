import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urikkiri_beta/core/widgets/main_navigation.dart';

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
          shadowColor: const Color(0xFF5E5E5E).withOpacity(0.3),
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Color(0xFF5B97E7),
          ),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          appBarTheme: AppBarTheme(
            toolbarHeight: 60,
            centerTitle: true,
            foregroundColor: const Color(0xFF323232),
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.white,
            titleTextStyle: GoogleFonts.notoSansKr(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF323232),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: const Color(0xFF5B97E7),
            unselectedItemColor: Colors.grey.shade400,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme:
                const IconThemeData(size: 28, color: Color(0xFF5B97E7)),
            unselectedIconTheme:
                IconThemeData(size: 24, color: Colors.grey.shade400),
            selectedLabelStyle: GoogleFonts.notoSansKr(fontSize: 14),
            unselectedLabelStyle: GoogleFonts.notoSansKr(fontSize: 12),
          ),
          textTheme: TextTheme(
            displayLarge: GoogleFonts.notoSansKr(
                fontSize: 60,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: const Color(0xFF323232)),
            displayMedium: GoogleFonts.notoSansKr(
                fontSize: 60,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
                color: const Color(0xFF323232)),
            displaySmall: GoogleFonts.notoSansKr(
                fontSize: 48, fontWeight: FontWeight.w800),
            headlineMedium: GoogleFonts.notoSansKr(
                fontSize: 34,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.25,
                color: const Color(0xFF323232)),
            headlineSmall: GoogleFonts.notoSansKr(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF323232)),
            titleLarge: GoogleFonts.notoSansKr(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
                color: const Color(0xFF323232)),
            titleMedium: GoogleFonts.notoSansKr(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
                color: const Color(0xFF323232)),
            titleSmall: GoogleFonts.notoSansKr(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: const Color(0xFF323232)),
            bodyLarge: GoogleFonts.notoSansKr(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: const Color(0xFF323232)),
            bodyMedium: GoogleFonts.notoSansKr(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.25,
                color: const Color(0xFF323232)),
            bodySmall: GoogleFonts.notoSansKr(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
                color: const Color(0xFF323232)),
            labelLarge: GoogleFonts.notoSansKr(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.25,
                color: const Color(0xFF323232)),
            labelSmall: GoogleFonts.notoSansKr(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                color: const Color(0xFF323232)),
          ),
        ),
        home: const MainNavigation(),
      ),
    );
  }
}
