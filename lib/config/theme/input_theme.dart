import 'package:flutter/material.dart';

class InputThemeDefault {
  InputDecorationTheme getTheme(Color colorOutline) {
    return InputDecorationTheme(
      suffixIconColor: colorOutline,
      hoverColor: colorOutline,
      focusColor: colorOutline,
      iconColor: colorOutline,
      fillColor: Colors.red[100],
      border: const OutlineInputBorder(),
      labelStyle: TextStyle(
        color: colorOutline,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        decorationColor: Colors.amber,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorOutline,
          width: 2,
        ),
      ),
    );
  }
}
