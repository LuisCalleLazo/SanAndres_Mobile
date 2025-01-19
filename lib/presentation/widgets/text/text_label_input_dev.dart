import 'package:flutter/material.dart';

class TextLabelInputDev extends StatelessWidget {
  final IconData icon;
  final String label;
  final EdgeInsetsGeometry padding;
  const TextLabelInputDev({
    super.key,
    required this.icon,
    required this.label,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 135, 22, 5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
