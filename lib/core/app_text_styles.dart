import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacina_me/core/app_colors.dart';

class AppTextStyles {
  static final TextStyle subtitle = TextStyle(
    fontSize: 21,
    color: AppColors.textColor.withOpacity(0.34),
  );

  static final TextStyle mobileSubtitle = GoogleFonts.poppins(
    fontSize: 17.0,
    color: AppColors.textColor,
  );

  static final TextStyle drawerItem = GoogleFonts.roboto(
    fontSize: 15.0,
    color: Colors.white,
  );

  static final TextStyle vaccinationForm = GoogleFonts.roboto(
    fontSize: 15.0,
    color: AppColors.textColor,
  );
}
