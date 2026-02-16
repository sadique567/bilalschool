import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Mytheme {
//   static final light = ThemeData.light().copyWith();
//   static final dark = ThemeData.dark().copyWith();
// }

/*
1. 05063C button bg color
2.648CEB   
3.E3E5F4  background color
  */

// ---- LIGHT THEME ----
ThemeData lightTheme() => ThemeData(
  // textTheme: GoogleFonts.rajdhaniTextTheme(),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFA51C30), // Axis Red
    secondary: Color(0xFF4B1E3D), // Plum Accent
    surface: Color(0xFFF8F8F8),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
  ),
  primaryColor: const Color(0xFF05063C),
  scaffoldBackgroundColor: const Color(0xFFE3E5F4),
  canvasColor: const Color(0xFFF6F6F6),
  cardColor: const Color(0xFFdbebfa),
  shadowColor: Colors.grey,
  brightness: Brightness.light,

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFE3E5F4),
    foregroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xFFA51C30),
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFA51C30),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF3F3F3),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFA51C30),
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
);

// 🔹 DARK THEME
ThemeData darkTheme() => ThemeData(
  // textTheme: GoogleFonts.rajdhaniTextTheme(),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFA51C30),
    secondary: Color(0xFF4B1E3D),
    surface: Color(0xFF1C1C1C),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
  ),
  primaryColor: const Color(0xFFA51C30),
  scaffoldBackgroundColor: const Color(0xFF121212),
  canvasColor: const Color(0xFF1E1E1E),
  cardColor: const Color(0xFF2A2A2A),
  shadowColor: Colors.black54,
  brightness: Brightness.dark,

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF4B1E3D),
    foregroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4B1E3D),
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFA51C30),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2A2A2A),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFA51C30),
    unselectedItemColor: Colors.grey,
    backgroundColor: Color(0xFF1E1E1E),
  ),
);
