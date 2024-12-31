import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/custom_dropdown.dart';
import 'package:san_andres_mobile/shared/constants/items_drop_down.dart';

class InputDateDev extends StatefulWidget {
  final String label;
  final ValueNotifier<int?> dropdownDay;
  final ValueNotifier<String?> dropdownMonth;
  final ValueNotifier<int?> dropdownYear;
  const InputDateDev({
    super.key,
    required this.label,
    required this.dropdownDay,
    required this.dropdownMonth,
    required this.dropdownYear,
  });

  @override
  State<InputDateDev> createState() => _InputDateDevState();
}

class _InputDateDevState extends State<InputDateDev> {
  final double maxHeigth = 400;
  final double itemHeigth = 50;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.date_range),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Día
              CustomDropdown<int>(
                width: 100,
                height: 40,
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
                width: 170,
                height: 40,
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
                width: 120,
                height: 40,
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