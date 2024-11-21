import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  // Heading Styles
  static TextStyle heading1({Color? color}) => GoogleFonts.lexend(
        fontSize: 40,
        fontWeight: FontWeight.w600, // Semibold
        color: color,
      );

  static TextStyle heading2({Color? color}) => GoogleFonts.lexend(
        fontSize: 32,
        fontWeight: FontWeight.w400, // Medium
        color: color,
      );

  static TextStyle heading3({Color? color}) => GoogleFonts.lexend(
        fontSize: 30,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle heading4({Color? color}) => GoogleFonts.lexend(
        fontSize: 24,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle heading5({Color? color}) => GoogleFonts.lexend(
        fontSize: 22,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  // Body Styles
  static TextStyle doubleExtraLargeTextMedium({Color? color}) =>
      GoogleFonts.lexend(
        fontSize: 20,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle doubleExtraLargeTextRegular({Color? color}) =>
      GoogleFonts.lexend(
        fontSize: 20,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  static TextStyle extraLargeTextMedium({Color? color}) => GoogleFonts.lexend(
        fontSize: 18,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle extraLargeTextRegular({Color? color}) => GoogleFonts.lexend(
        fontSize: 18,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  static TextStyle largeTextMedium({Color? color}) => GoogleFonts.lexend(
        fontSize: 16,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle largeTextBold({Color? color}) => GoogleFonts.lexend(
        fontSize: 21,
        fontWeight: FontWeight.w700, 
        color: color,
      );

      static TextStyle extraLargeTextBold({Color? color}) => GoogleFonts.lexend(
        fontSize: 24,
        fontWeight: FontWeight.w700, 
        color: color,
      );


  static TextStyle largeTextRegular({Color? color}) => GoogleFonts.lexend(
        fontSize: 16,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  static TextStyle mediumTextBold({Color? color}) => GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w700, // Medium
        color: color,
      );

  static TextStyle mediumTextMedium({Color? color}) => GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle mediumTextRegular({Color? color}) => GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  static TextStyle smallTextMedium({Color? color}) => GoogleFonts.lexend(
        fontSize: 12,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle smallTextRegular({Color? color}) => GoogleFonts.lexend(
        fontSize: 12,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  static TextStyle extraSmallTextMedium({Color? color}) => GoogleFonts.lexend(
        fontSize: 10,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle extraSmallTextRegular({Color? color}) => GoogleFonts.lexend(
        fontSize: 10,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  // Display Styles
  static TextStyle display1({Color? color}) => GoogleFonts.lexend(
        fontSize: 56,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );

  static TextStyle display2({Color? color}) => GoogleFonts.lexend(
        fontSize: 28,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      );

  static TextStyle display3({Color? color}) => GoogleFonts.lexend(
        fontSize: 28,
        fontWeight: FontWeight.w400, // Regular
        color: color,
      );
}
