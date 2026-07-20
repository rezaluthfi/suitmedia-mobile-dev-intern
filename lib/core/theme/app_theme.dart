import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final String? poppinsFont = GoogleFonts.poppins().fontFamily;

    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: Colors.white,

      fontFamily: poppinsFont,

      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleTextStyle: TextStyle(
          fontFamily: poppinsFont,
          color: const Color(0xFF1A202C),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
