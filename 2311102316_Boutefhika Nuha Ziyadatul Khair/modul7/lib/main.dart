import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4537E),
          primary: const Color(0xFFD4537E),
          secondary: const Color(0xFFF2C4D0),
          surface: const Color(0xFFFFF8F9),
          background: const Color(0xFFFFF8F9),
          onPrimary: Colors.white,
          onSurface: const Color(0xFF5C3341),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F9),
        textTheme: GoogleFonts.dmSerifDisplayTextTheme().copyWith(
          bodyMedium: GoogleFonts.dmSans(
              color: const Color(0xFF5C3341), fontSize: 14),
          bodySmall: GoogleFonts.dmSans(
              color: const Color(0xFFB89098), fontSize: 12),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFFF8F9),
          foregroundColor: const Color(0xFF5C3341),
          elevation: 0,
          centerTitle: true,
          scrolledUnderElevation: 0,
          titleTextStyle: GoogleFonts.dmSerifDisplay(
            color: const Color(0xFF5C3341),
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          iconTheme: const IconThemeData(color: Color(0xFFC47A8A)),
        ),
        dividerColor: const Color(0xFFF2D9DF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4537E),
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            textStyle: GoogleFonts.dmSans(
                fontSize: 14, fontWeight: FontWeight.w500,
                letterSpacing: 0.4),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFF2D9DF)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFF2D9DF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color(0xFFD4537E), width: 1.5),
          ),
          labelStyle:
              GoogleFonts.dmSans(color: const Color(0xFFB89098), fontSize: 13),
          prefixIconColor: const Color(0xFFD4A0B0),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}