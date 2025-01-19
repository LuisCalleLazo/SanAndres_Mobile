import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:san_andres_mobile/presentation/widgets/text/text_label_input_dev.dart';

class InputDefault extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? value;
  final TextEditingController controller;
  final Color color;
  final TextInputType type;
  final InputDecoration? decoration;
  final bool readOnly;
  final Color bg;

  const InputDefault({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    this.value,
    this.bg = Colors.transparent,
    this.readOnly = false,
    this.decoration,
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
          TextLabelInputDev(icon: widget.icon, label: widget.label),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              color: widget.bg,
              child: TextField(
                controller: widget.controller,
                readOnly: widget.readOnly,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 15,
                ),
                keyboardType: widget.type,
                cursorColor: const Color.fromARGB(255, 135, 22, 5),
                decoration: widget.decoration ??
                    InputDecoration(
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
          ),
        ],
      ),
    );
  }
}
