import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de Cores Sofisticada
  static const Color primaryColor = Color(0xFF00C8A0); // Um verde-água vibrante
  static const Color backgroundColor = Color(0xFF121212); // Preto quase puro para o fundo
  static const Color cardColor = Color(0xFF1E1E1E); // Um cinza escuro para os cards
  static const Color textColor = Color(0xFFE0E0E0); // Branco suave para textos
  static const Color accentColor = Color(0xFFBDBDBD); // Cinza claro para detalhes

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      
      // Tema da AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Tema dos Cards
      cardTheme: CardTheme(
        color: cardColor,
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      
      // Tema de Texto com Google Fonts
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.poppins(color: textColor, fontWeight: FontWeight.w700),
        headlineSmall: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.w600),
        titleLarge: GoogleFonts.poppins(color: textColor, fontWeight: FontWeight.w600),
        bodyMedium: GoogleFonts.poppins(color: accentColor, fontSize: 16),
        labelLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      
      // Tema dos Botões
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      
      // Tema dos Campos de Texto
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        labelStyle: GoogleFonts.poppins(color: accentColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),
    );
  }
}