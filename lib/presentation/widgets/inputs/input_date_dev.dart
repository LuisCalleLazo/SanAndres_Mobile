
import 'package:flutter/material.dart';
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
  // Maximos valores de tamaño de field
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
                    fontSize: 16,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Día
              DropdownButton<int>(
                menuMaxHeight: maxHeigth,
                itemHeight: itemHeigth,
                hint: const Text("Día"),
                value: selectedDay,
                onChanged: (value) {
                  setState(() {
                    selectedDay = value;
                    widget.dropdownDay.value = value;
                  });
                },
                items: days.map((day) {
                  return DropdownMenuItem<int>(
                    value: day,
                    child: Text(day.toString()),
                  );
                }).toList(),
              ),
              // Mes
              DropdownButton<String>(
                menuMaxHeight: maxHeigth,
                itemHeight: itemHeigth,
                hint: const Text("Mes"),
                value: selectedMonth,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                    widget.dropdownMonth.value = value;
                  });
                },
                items: monthsDefault.map(
                  (month) {
                    return DropdownMenuItem<String>(
                      value: month,
                      child: Text(month),
                    );
                  },
                ).toList(),
              ),
              // Año
              DropdownButton<int>(
                menuMaxHeight: maxHeigth,
                itemHeight: itemHeigth,
                hint: const Text("Año"),
                value: selectedYear,
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                    widget.dropdownYear.value = value;
                  });
                },
                items: years.map(
                  (year) {
                    return DropdownMenuItem<int>(
                      value: year,
                      child: Text(year.toString()),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
