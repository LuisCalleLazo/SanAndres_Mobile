import 'package:flutter/material.dart';

class FloatBtnTheme {
  FloatingActionButtonThemeData getTheme(Color colorOutline) {
    return const FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(195, 40, 40, 1),
      elevation: 15,
      foregroundColor: Colors.white,
      focusElevation: 10,
    );
  }
}
