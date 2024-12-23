import 'package:flutter/material.dart';

class DropdownDefult extends StatefulWidget {
  final List<String> items;
  final String text;
  final double width;
  final double heigth;
  const DropdownDefult({
    super.key,
    required this.items,
    required this.text,
    this.width = double.infinity,
    this.heigth = 50
  });

  @override
  State<DropdownDefult> createState() => _DropdownDefultState();
}

class _DropdownDefultState extends State<DropdownDefult> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: DropdownButtonFormField<String>(
        alignment: Alignment.centerRight,
        iconSize: 30,
        borderRadius: BorderRadius.circular(10),
        focusColor: Colors.amber,
        value: selectedValue,
        hint: Text(
          widget.text,
          textAlign: TextAlign.right,
        ),
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(
              alignment: Alignment.center,
              child: Text(value),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
      ),
    );
  }
}
