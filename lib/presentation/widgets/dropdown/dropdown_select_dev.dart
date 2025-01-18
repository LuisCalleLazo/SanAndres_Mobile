import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

class DropdownSelectDev extends StatefulWidget {
  final List<SelectItems> items;
  final ValueNotifier<int?> selectedId;
  const DropdownSelectDev({
    super.key,
    required this.items,
    required this.selectedId,
  });

  @override
  State<DropdownSelectDev> createState() => _DropdownSelectDevState();
}

class _DropdownSelectDevState extends State<DropdownSelectDev> {
  List<SelectItems> filteredItems = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;

    searchController.addListener(() {
      setState(() {
        final query = searchController.text.toLowerCase();
        filteredItems = widget.items
            .where((item) => item.label.toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDefault(
          label: "Busqueda",
          controller: searchController,
          icon: Icons.search,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButton<int?>(
            isExpanded: true,
            value: widget.selectedId.value,
            items: filteredItems.map((item) {
              return DropdownMenuItem<int>(
                value: item.id,
                child: Text(item.label),
              );
            }).toList(),
            onChanged: (int? newValue) {
              setState(() {
                widget.selectedId.value = newValue;
              });
            },
            hint: const Text('Selecciona una opción'),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
