import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

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
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFF8B6F47),
          onPrimary: const Color(0xFFFDF6EC),
          secondary: const Color(0xFFB8975A),
          onSecondary: const Color(0xFFFDF6EC),
          error: const Color(0xFFB85C38),
          onError: Colors.white,
          surface: const Color(0xFFFDF6EC),
          onSurface: const Color(0xFF4A3728),
          surfaceContainerHighest: const Color(0xFFF5E6D0),
          onSurfaceVariant: const Color(0xFF6B5240),
          outline: const Color(0xFFD4B896),
          outlineVariant: const Color(0xFFE8D5BC),
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: const Color(0xFF4A3728),
          onInverseSurface: const Color(0xFFFDF6EC),
          inversePrimary: const Color(0xFFD4A76A),
          primaryContainer: const Color(0xFFF5E6D0),
          onPrimaryContainer: const Color(0xFF4A3728),
          secondaryContainer: const Color(0xFFEDD9BA),
          onSecondaryContainer: const Color(0xFF4A3728),
          tertiaryContainer: const Color(0xFFFAF0E0),
          onTertiaryContainer: const Color(0xFF5C4030),
          tertiary: const Color(0xFF9E7A4A),
          onTertiary: const Color(0xFFFDF6EC),
          errorContainer: const Color(0xFFFDE8DF),
          onErrorContainer: const Color(0xFF5C1A05),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF3E8),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF8B6F47),
          foregroundColor: const Color(0xFFFDF6EC),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            color: const Color(0xFFFDF6EC),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B6F47),
            foregroundColor: const Color(0xFFFDF6EC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFDF6EC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD4B896)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD4B896)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF8B6F47), width: 2),
          ),
          labelStyle: GoogleFonts.poppins(color: const Color(0xFF8B6F47)),
          hintStyle: GoogleFonts.poppins(color: const Color(0xFFB8975A)),
        ),
      ),
      home: const HomePage(),
    );
  }
}
