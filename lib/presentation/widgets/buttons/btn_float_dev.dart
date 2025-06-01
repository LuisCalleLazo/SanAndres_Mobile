import 'package:flutter/material.dart';

class BtnFloatDev extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color? bg;
  const BtnFloatDev({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.color = Colors.white,
    this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: onPressed,
          heroTag: text,
          backgroundColor:
              bg ?? Theme.of(context).floatingActionButtonTheme.backgroundColor,
          child: Icon(icon),
        ),
        SizedBox(height: text == "" ? 0 : 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
