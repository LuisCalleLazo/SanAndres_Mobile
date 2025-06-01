import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownTheme {
  final Color outlineColor;

  DropdownTheme(this.outlineColor);
  DropdownMenuThemeData getTheme() {
    return DropdownMenuThemeData(
      textStyle: GoogleFonts.sairaStencilOne(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: outlineColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: outlineColor, width: 2),
        ),
      ),
      // menuStyle: MenuStyle(
      //   backgroundColor: MaterialStateProperty.all(Colors.white),
      //   elevation: MaterialStateProperty.all(4.0),
      //   side: MaterialStateProperty.all(
      //     BorderSide(color: outlineColor),
      //   ),
      // ),
    );
  }
}
