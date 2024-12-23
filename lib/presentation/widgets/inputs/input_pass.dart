import 'package:flutter/material.dart';

class InputPass extends StatefulWidget {
  final TextEditingController controller;
  const InputPass({
    super.key,
    required this.controller,
  });

  @override
  State<InputPass> createState() => _InputPassState();
}

class _InputPassState extends State<InputPass> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          vertical: 1.0, horizontal: 20.0),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 20,
        ),
        cursorColor: const Color.fromRGBO(255, 179, 0, 1),
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(Icons.password),
          label: const Text("Ingresa tu contraseña"),
          suffixIcon: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: const Icon(Icons.remove_red_eye_sharp),
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
