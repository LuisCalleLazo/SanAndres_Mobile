import 'package:flutter/material.dart';

class TextDecorationDev extends StatelessWidget {
  final Color? bg;
  final Color? textColor;
  final String text;
  final double? width;
  const TextDecorationDev({
    super.key,
    this.bg = Colors.red,
    this.textColor = Colors.black,
    required this.text,
    this.width = 140,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 3),
      width: width,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
