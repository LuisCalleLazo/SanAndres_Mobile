
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final double width;
  final double height;
  final List<T> items;
  final T? value;
  final String hint;
  final ValueChanged<T?> onChanged;

  const CustomDropdown({
    super.key,
    required this.width,
    required this.height,
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 210, 14, 0)),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Center(
        child: DropdownButton<T>(
          isExpanded: true,
          menuMaxHeight: 400,
          itemHeight: 50,
          hint: Text(hint),
          value: value,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Center(child: Text(item.toString())),
            );
          }).toList(),
        ),
      ),
    );
  }
}
