import 'package:flutter/material.dart';

class InputTextAreaDev extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color color;
  const InputTextAreaDev({
    super.key,
    required this.label,
    required this.controller,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: color,
          fontSize: 16,
        ),
        maxLines: 5,
        cursorColor: const Color.fromARGB(255, 221, 165, 34),
        decoration: InputDecoration(
          icon: const Icon(Icons.text_fields_sharp),
          labelText: label,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
