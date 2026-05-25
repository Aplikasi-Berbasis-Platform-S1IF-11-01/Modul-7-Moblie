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
        // ── Warna utama ──────────────────────────────────────────
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A73E8),
          primary: const Color(0xFF1A73E8),
          secondary: const Color(0xFF00C2A8),
          tertiary: const Color(0xFFFF6B35),
          surface: const Color(0xFFF8FAFF),
          background: const Color(0xFFF0F4FF),
        ),
        useMaterial3: true,

        // ── Typography via Google Fonts ───────────────────────────
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          displayLarge: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: const Color(0xFF1A1A2E),
          ),
          headlineMedium: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: const Color(0xFF1A1A2E),
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF4A4A6A),
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF6B6B8A),
          ),
        ),

        // ── AppBar ────────────────────────────────────────────────
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A73E8),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),

        // ── ElevatedButton ────────────────────────────────────────
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A73E8),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            elevation: 3,
          ),
        ),

        // ── Input field ───────────────────────────────────────────
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD0D5E8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD0D5E8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color(0xFF1A73E8), width: 2),
          ),
          labelStyle: GoogleFonts.poppins(
            color: const Color(0xFF6B6B8A),
            fontSize: 14,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}