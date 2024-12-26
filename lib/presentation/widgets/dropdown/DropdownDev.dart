import 'package:flutter/material.dart';

class DropdownDev extends StatefulWidget {
  final List<String> items;
  final String text;
  final double width;
  final double heigth;
  final ValueNotifier<String?> value;
  const DropdownDev({
    super.key,
    required this.items,
    required this.text,
    this.width = double.infinity,
    this.heigth = 50,
    required this.value,
  });

  @override
  State<DropdownDev> createState() => _DropdownDevState();
}

class _DropdownDevState extends State<DropdownDev> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    selectedValue ??= widget.value.value;
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: DropdownButtonFormField<String>(
          alignment: Alignment.centerLeft,
          iconSize: 30,
          borderRadius: BorderRadius.circular(10),
          focusColor: Colors.red,
          value: selectedValue,
          hint: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.text,
              textAlign: TextAlign.left,
            ),
          ),
          items: widget.items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(value),
                ),
              );
            },
          ).toList(),
          onChanged: (String? newValue) {
            setState(
              () {
                selectedValue = newValue;
                widget.value.value = newValue;
              },
            );
          }),
    );
  }
}
