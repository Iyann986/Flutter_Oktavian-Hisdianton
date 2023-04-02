import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactTheme {
  static double horizontalMargin = 20.0;
  static double verticalMargin = 18.0;

  static Color backgroundColor = const Color(0xffefefef);
  static Color primaryColor = const Color(0xff43AF9F);

  static Color successColor = Colors.green.shade900;
  static Color errorColor = Colors.red.shade900;

  static Color primaryTextColor = const Color(0xff454b54);
  static Color secondaryTextColor = const Color(0xffA09A9A);

  static TextStyle primaryTextStyle =
      GoogleFonts.montserrat(color: const Color(0xff454b54));
  static TextStyle secondaryTextStyle =
      GoogleFonts.montserrat(color: const Color(0xffA09A9A));

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
}
