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
      debugShowCheckedModeBanner: false,
      title: 'Tugas Praktikum M7',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF8BBD0), 
          primary: const Color(0xFFF06292),
          secondary: const Color(0xFFFF80AB),
          surface: const Color(0xFFFFF5F8),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}