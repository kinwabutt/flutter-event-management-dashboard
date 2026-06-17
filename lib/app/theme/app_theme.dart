import 'package:flutter/material.dart';

class AppTheme {
  // Light theme definition jo main.dart call kar raha hai
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.teal,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      
      // AppBar Theme Customization
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        primary: Colors.teal,
        background: const Color(0xFFF8FAFC),
      ),
    );
  }
}