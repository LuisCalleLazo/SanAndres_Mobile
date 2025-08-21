import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final Widget child;
  final double height;
  final Color borderColor;

  const CustomSnackbar({
    super.key,
    required this.child,
    this.height = 80.0,
    this.borderColor = const Color.fromARGB(255, 155, 8, 8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: borderColor,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }

  static void show({
    required BuildContext context,
    required Widget content,
    double height = 80.0,
    Color borderColor = const Color(0xFF8B0000),
    Duration duration = const Duration(seconds: 100),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration,
        content: CustomSnackbar(
          height: height,
          borderColor: borderColor,
          child: content,
        ),
      ),
    );
  }
}