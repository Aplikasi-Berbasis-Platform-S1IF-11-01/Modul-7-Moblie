import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DataMahasiswaApp());
}

class DataMahasiswaApp extends StatelessWidget {
  const DataMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4DB6AC),
          primary: const Color(0xFF4DB6AC),
          secondary: const Color(0xFFFF8A65),
          tertiary: const Color(0xFFF48FB1),
          surface: const Color(0xFFF9FFFE),
          background: const Color(0xFFF0FBF9),
        ),
        useMaterial3: true,

        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
          displayLarge: GoogleFonts.nunito(
            fontWeight: FontWeight.w800,
            fontSize: 32,
            color: const Color(0xFF1A3C34),
          ),
          headlineMedium: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: const Color(0xFF1A3C34),
          ),
          bodyLarge: GoogleFonts.nunito(
            fontSize: 16,
            color: const Color(0xFF4A6B65),
          ),
          bodyMedium: GoogleFonts.nunito(
            fontSize: 14,
            color: const Color(0xFF7A9E98),
          ),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF4DB6AC),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4DB6AC),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            elevation: 2,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFB2DFDB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFB2DFDB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF4DB6AC), width: 2),
          ),
          labelStyle: GoogleFonts.nunito(
            color: const Color(0xFF7A9E98),
            fontSize: 14,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}