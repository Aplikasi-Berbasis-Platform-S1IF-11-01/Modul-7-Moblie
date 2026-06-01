import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp - StatelessWidget sebagai root aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Color palette sesuai yang diberikan
        primaryColor: const Color(0xFF145A43),
        scaffoldBackgroundColor: const Color(0xFF0B3D2E),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF2F8F6F),
          secondary: const Color(0xFFD7C7A1),
          surface: const Color(0xFF145A43),
          onPrimary: Colors.white,
          onSecondary: const Color(0xFF0F0F0F),
          onSurface: Colors.white,
        ),
        // Google Fonts Poppins sebagai default
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF145A43),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Color(0xFFD7C7A1)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2F8F6F),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF145A43).withValues(alpha: 0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2F8F6F)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2F8F6F), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD7C7A1), width: 2),
          ),
          labelStyle: GoogleFonts.poppins(color: const Color(0xFFD7C7A1)),
          hintStyle: GoogleFonts.poppins(color: Colors.white54),
          prefixIconColor: const Color(0xFFD7C7A1),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: const Color(0xFF2F8F6F),
          contentTextStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      ),
      home: const HomePage(),
    );
  }
}
