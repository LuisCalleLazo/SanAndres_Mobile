import 'package:flutter/material.dart';
import 'package:san_andres_mobile/config/theme/flt_btn_theme.dart';
import 'package:san_andres_mobile/config/theme/input_theme.dart';

class AppTheme {
  final Color _colorOutline = const Color.fromARGB(255, 82, 1, 1);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.red[500],
          selectionHandleColor: Colors.red[500],
        ),
        iconTheme: IconThemeData(
          color: _colorOutline,
          size: 25,
        ),
        inputDecorationTheme: InputThemeDefault().getTheme(_colorOutline),
        floatingActionButtonTheme: FloatBtnTheme().getTheme(_colorOutline),
      );
}
