import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/custom_dropdown.dart';
import 'package:san_andres_mobile/shared/constants/items_drop_down.dart';

class InputDateDev extends StatefulWidget {
  final String label;
  final double widthDay;
  final double widthMonth;
  final double widthYear;
  final ValueNotifier<int?> dropdownDay;
  final ValueNotifier<String?> dropdownMonth;
  final ValueNotifier<int?> dropdownYear;
  const InputDateDev({
    super.key,
    required this.label,
    required this.dropdownDay,
    required this.dropdownMonth,
    required this.dropdownYear,
    this.widthDay = 100,
    this.widthMonth = 170,
    this.widthYear = 120,
  });

  @override
  State<InputDateDev> createState() => _InputDateDevState();
}

class _InputDateDevState extends State<InputDateDev> {
  final double maxHeigth = 400;
  final double itemHeigth = 100;

  // Listas para los valores de días, meses y años
  final List<int> days = List.generate(31, (index) => index + 1);
  final List<int> years =
      List.generate(100, (index) => DateTime.now().year - index);

  // Valores seleccionados
  int? selectedDay;
  String? selectedMonth;
  int? selectedYear;

  @override
  Widget build(BuildContext context) {
    selectedDay ??= widget.dropdownDay.value;
    selectedMonth ??= widget.dropdownMonth.value;
    selectedYear ??= widget.dropdownYear.value;
    const double heigthDropdown = 50;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20),
            child: Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 123, 13, 13),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Día
              CustomDropdown<int>(
                width: widget.widthDay,
                height: heigthDropdown,
                items: days,
                value: selectedDay,
                hint: "Día",
                onChanged: (value) {
                  setState(() {
                    selectedDay = value;
                    widget.dropdownDay.value = value;
                  });
                },
              ),
              // Mes
              CustomDropdown<String>(
                width: widget.widthMonth,
                height: heigthDropdown,
                items: monthsDefault,
                value: selectedMonth,
                hint: "Mes",
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                    widget.dropdownMonth.value = value;
                  });
                },
              ),
              // Año
              CustomDropdown<int>(
                width: widget.widthYear,
                height: heigthDropdown,
                items: years,
                value: selectedYear,
                hint: "Año",
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                    widget.dropdownYear.value = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
