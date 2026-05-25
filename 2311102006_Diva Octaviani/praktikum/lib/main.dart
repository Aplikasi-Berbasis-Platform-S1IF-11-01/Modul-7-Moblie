import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A0DAD),
          brightness: Brightness.dark,
          primary: const Color(0xFF9B59B6),
          secondary: const Color(0xFFD4A0F7),
          surface: const Color(0xFF1A0A2E),
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F0720),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.dark().textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A0A2E),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7C3AED),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF2D1054),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF6A0DAD), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF4A1080), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF9B59B6), width: 2),
          ),
          labelStyle: GoogleFonts.plusJakartaSans(
            color: const Color(0xFFBB86FC),
            fontSize: 14,
          ),
          hintStyle: GoogleFonts.plusJakartaSans(
            color: Colors.white38,
            fontSize: 14,
          ),
          prefixIconColor: const Color(0xFF9B59B6),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF1E0D3A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFF3D1A6E), width: 1),
          ),
          elevation: 4,
          shadowColor: const Color(0xFF6A0DAD).withOpacity(0.3),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
