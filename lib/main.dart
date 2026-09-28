import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

void main() {
  runApp(const UdgamApp());
}

class UdgamApp extends StatelessWidget {
  const UdgamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UDGAMIAC 2027 | CDC IITRAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF51A8B1),
          secondary: Color(0xFFD2E28A),
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF51A8B1),
            foregroundColor: const Color(0xFFD2E28A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
