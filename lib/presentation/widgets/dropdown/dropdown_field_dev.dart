import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_dev.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

class DropdownFieldDev extends StatefulWidget {
  final List<SelectItems> items;
  final String text;
  final double width;
  final double heigth;
  final String label;
  final IconData icon;
  final double pV;
  final double pH;
  final ValueNotifier<int?> value;
  const DropdownFieldDev({
    super.key,
    required this.items,
    required this.text,
    this.width = 300,
    this.heigth = 80,
    this.label = "Seleccion",
    this.pV = 12,
    this.pH = 10,
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
            padding: EdgeInsets.only(bottom: 10, left: widget.pH),
            child: Row(
              children: [
                Icon(widget.icon),
                const SizedBox(width: 20),
                Align(
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
              ],
            ),
          ),
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
    );
  }
}
