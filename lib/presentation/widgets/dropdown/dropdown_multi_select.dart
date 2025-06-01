import 'package:flutter/material.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

class DropdownMultiSelect extends StatefulWidget {
  final List<SelectItems> items;
  final ValueNotifier<List<int>> selectedIds;
  const DropdownMultiSelect({
    super.key,
    required this.items,
    required this.selectedIds,
  });

  @override
  State<DropdownMultiSelect> createState() => _DropdownMultiSelectState();
}

class _DropdownMultiSelectState extends State<DropdownMultiSelect> {
  List<int> selectedIds = [];

  @override
  void initState() {
    super.initState();
    // Inicia con los valores del ValueNotifier
    selectedIds = widget.selectedIds.value;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.items.isEmpty
          ? const Text("No hay opciones disponibles")
          : ListBody(
              children: widget.items.map(
                (item) {
                  return CheckboxListTile(
                    title: Text(item.label),
                    value: selectedIds.contains(item.id),
                    onChanged: (bool? selected) {
                      setState(
                        () {
                          if (selected == true) {
                            selectedIds.add(item.id);
                          } else {
                            selectedIds.remove(item.id);
                          }
                        },
                      );
                    },
                  );
                },
              ).toList(),
            ),
    );
  }
}
