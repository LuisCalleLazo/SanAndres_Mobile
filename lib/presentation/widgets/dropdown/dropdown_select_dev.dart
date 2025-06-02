import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_min.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/presentation/widgets/text/text_label_input_dev.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';
import 'dart:math' as math;

class DropdownSelectDev extends StatefulWidget {
  final List<SelectItems> items;
  final ValueNotifier<int?> selectedId;
  final String label;
  const DropdownSelectDev({
    super.key,
    required this.items,
    required this.selectedId,
    this.label = "Busqueda",
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

  void _showSnackbarSelect(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    const snackbar = SnackBar(
      backgroundColor: Colors.white,
      content: _SnackbarSelectItems(),
      duration: Duration(hours: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    double heigth = math.max(MediaQuery.of(context).size.height * 0.08, 80);
    return InkWell(
      onTap: () {
        _showSnackbarSelect(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: Colors.grey[350],
          height: heigth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextLabelInputDev(
                icon: Icons.search,
                label: widget.label,
                padding: const EdgeInsets.all(0),
              ),
              SizedBox(
                child: TextField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    alignLabelWithHint: false,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(0, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SnackbarSelectItems extends StatefulWidget {
  const _SnackbarSelectItems();

  @override
  State<_SnackbarSelectItems> createState() => _SnackbarSelectItemsState();
}

class _SnackbarSelectItemsState extends State<_SnackbarSelectItems> {
  final InputControllerManager _inputManager = InputControllerManager();

  List<int> selectedCardIndices = [];
  @override
  Widget build(BuildContext context) {
    double heightSnack = MediaQuery.of(context).size.height * 0.75;
    return Container(
      height: heightSnack,
      padding: const EdgeInsets.only(top: 10),
      child: ListView(
        children: [
          SizedBox(
            height: heightSnack * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  6,
                  (index) {
                    return CardAutopartMin(
                      isChecked: selectedCardIndices.contains(index),
                      onTap: () {
                        setState(() {
                          if (selectedCardIndices.contains(index)) {
                            selectedCardIndices.remove(index);
                          } else {
                            selectedCardIndices.add(index);
                          }
                        });
                      },
                      autopart: AutopartList(id: 1, info: [], category: ""),
                    );
                  },
                ),
              ),
            ),
          ),
          InputDefault(
            label: "Buscar producto",
            controller: _inputManager.getController("search"),
            icon: Icons.search,
          ),
        ],
      ),
    );
  }
}
