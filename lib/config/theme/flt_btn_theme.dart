import 'package:flutter/material.dart';

class FloatBtnTheme {
  FloatingActionButtonThemeData getTheme(Color colorOutline) {
    return const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(137, 52, 0, 1),
      elevation: 15,
      foregroundColor: Colors.white,
      focusElevation: 10,
    );
  }
}
