import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF00091A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFDC052D),
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDC052D),
          primary: const Color(0xFFDC052D),
          secondary: const Color(0xFFDC052D),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme.copyWith(
                bodyLarge: const TextStyle(color: Colors.white),
                bodyMedium: const TextStyle(color: Colors.white70),
                titleLarge: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        cardColor: const Color(0xFF111A2A),
        cardTheme: const CardTheme(
          elevation: 4,
          shadowColor: Colors.black45,
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
