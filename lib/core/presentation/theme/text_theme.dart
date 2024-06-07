import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static final bodySmall = GoogleFonts.sora(
    fontSize: 12,
    color: Colors.white,
  );
  static final bodyMedium = GoogleFonts.sora(
    fontSize: 14,
    color: Colors.white,
  );
  static final bodyLarge = GoogleFonts.sora(
    fontSize: 16,
    color: Colors.white,
  );
  static final bodyXLarge = GoogleFonts.sora(
    fontSize: 18,
    color: Colors.white,
  );
  static final title = GoogleFonts.sora(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
  static final titleLarge = GoogleFonts.sora(
    fontSize: 34,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
}
