import 'package:flutter/material.dart';
import 'dart:math' as math;

class InputPass extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const InputPass({
    super.key,
    this.label = "Ingrese contraseña:",
    required this.controller,
  });

  @override
  State<InputPass> createState() => _InputPassState();
}

class _InputPassState extends State<InputPass> {
  bool _obscureText = true;
  bool isFocused = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double heigth = math.max(MediaQuery.of(context).size.height * 0.08, 100);
    return SizedBox(
      height: heigth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: [
                const Icon(Icons.password),
                const SizedBox(width: 20),
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 135, 22, 5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: widget.controller,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              cursorColor: const Color.fromARGB(255, 123, 17, 3),
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                alignLabelWithHint: false,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 135, 22, 5),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: _togglePasswordVisibility,
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.red,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  isFocused = true;
                });
              },
              onEditingComplete: () {
                setState(() {
                  isFocused = false;
                });
              },
              onSubmitted: (_) {
                setState(() {
                  isFocused = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
