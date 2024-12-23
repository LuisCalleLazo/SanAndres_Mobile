import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  final String text;
  final Color color;
  const TextMessage({
    super.key,
    required this.text,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
