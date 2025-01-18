import 'package:flutter/material.dart';
import 'dart:math' as math;
class InputDefault extends StatefulWidget {
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
  State<InputDefault> createState() => _InputDefaultState();
}

class _InputDefaultState extends State<InputDefault> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    double heigth = math.max(MediaQuery.of(context).size.height * 0.08, 80);
    widget.controller.text = widget.value ?? "";
    return SizedBox(
      height: heigth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 135, 22, 5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 14),
            child: TextField(
              controller: widget.controller,
              style: TextStyle(
                color: widget.color,
                fontSize: 15,
              ),
              keyboardType: widget.type,
              cursorColor: const Color.fromARGB(255, 135, 22, 5),
              decoration: InputDecoration(
                icon: Icon(widget.icon),
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
