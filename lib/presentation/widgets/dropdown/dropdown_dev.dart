import 'package:flutter/material.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

class DropdownDev extends StatefulWidget {
  final List<SelectItems> items;
  final String text;
  final double width;
  final double heigth;
  final ValueNotifier<int?> value;
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
  @override
  Widget build(BuildContext context) {
    List<SelectItems> sortedItems = List.from(widget.items);
    sortedItems.sort((a, b) => a.label.compareTo(b.label));

    final selectedItem = sortedItems.firstWhere(
      (item) => item.id == widget.value.value,
      orElse: () => widget.items.first,
    );
    return SizedBox(
      width: widget.width,
      height: widget.heigth,
      child: DropdownButtonFormField<SelectItems>(
        alignment: Alignment.centerLeft,
        iconSize: 30,
        borderRadius: BorderRadius.circular(10),
        focusColor: Colors.red,
        value: selectedItem,
        hint: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            widget.text,
            textAlign: TextAlign.left,
          ),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 139, 22, 13)),
          ),
        ),
        items: sortedItems.map<DropdownMenuItem<SelectItems>>(
          (SelectItems value) {
            return DropdownMenuItem<SelectItems>(
              value: value,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(value.label),
              ),
            );
          },
        ).toList(),
        onChanged: (SelectItems? newValue) {
          setState(
            () {
              widget.value.value = newValue?.id;
            },
          );
        },
      ),
    );
  }
}
