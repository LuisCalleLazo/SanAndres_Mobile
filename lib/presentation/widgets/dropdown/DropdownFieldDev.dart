import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/DropDownDev.dart';

class DropdownFieldDev extends StatefulWidget {
  final List<String> items;
  final String text;
  final double width;
  final double heigth;
  final String label;
  final IconData icon;
  final double pV;
  final double pH;
  final ValueNotifier<String?> value;
  const DropdownFieldDev({
    super.key,
    required this.items,
    required this.text,
    this.width = 300,
    this.heigth = 50,
    this.label = "Seleccion",
    this.pV = 12,
    this.pH = 20,
    this.icon = Icons.abc_rounded,
    required this.value,
  });

  @override
  State<DropdownFieldDev> createState() => _DropdownFieldDevState();
}

class _DropdownFieldDevState extends State<DropdownFieldDev> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.pV, horizontal: widget.pH),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 41),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 135, 22, 5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(widget.icon),
              SizedBox(
                width: widget.width,
                height: widget.heigth,
                child: DropdownDev(
                  items: widget.items,
                  text: widget.text,
                  width: widget.width,
                  value: widget.value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
