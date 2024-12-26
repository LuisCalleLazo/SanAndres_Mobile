import 'package:flutter/material.dart';

class InputDefault extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? value;
  final TextEditingController controller;
  final Color color;
  final TextInputType type;

  const InputDefault({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    this.value,
    this.type = TextInputType.text,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = value ?? "";
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          vertical: 1.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: color,
          fontSize: 15,
        ),
        keyboardType: type,
        cursorColor: const Color.fromARGB(255, 135, 22, 5),
        decoration: InputDecoration(
          icon: Icon(icon),
          label: Text(
            label,
            style: const TextStyle(fontSize: 13),
          ),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
