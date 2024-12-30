import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_add_sale.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_min.dart';
import 'package:san_andres_mobile/presentation/widgets/dialogs/filter_dialog.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_date_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';

class AddSalePage extends StatefulWidget {
  static String name = "add_sale_page";

  const AddSalePage({super.key});

  @override
  State<AddSalePage> createState() => _AddSalePageState();
}

class _AddSalePageState extends State<AddSalePage> {
  final InputControllerManager _inputManager = InputControllerManager();

  final valueManagerString = ValueNotifierManager<String?>();
  final valueManagerInt = ValueNotifierManager<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar nueva venta"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          InputDateDev(
            label: "Fecha de venta",
            dropdownDay: valueManagerInt.getNotifier('date_day_last'),
            dropdownMonth: valueManagerString.getNotifier('date_month_last'),
            dropdownYear: valueManagerInt.getNotifier('date_year_last'),
          ),
          Divider(color: Colors.red[900], thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.57,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(6, (index) {
                  return const CardAddSale();
                }),
              ),
            ),
          ),
          Divider(color: Colors.red[900], thickness: 2),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "10 000 Bs",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Divider(color: Colors.red[900], thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: BtnTextDefault(
              onPressed: () {},
              color: Colors.red[900],
              text: "Guardar",
              width: 150,
              maxWidth: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
      floatingActionButton: BtnFloatDev(
        onPressed: () {
          _showSelectDialog(context);
        },
        icon: Icons.add,
        text: "",
      ),
    );
  }

  _showSelectDialog(BuildContext context) {
    // Lista para almacenar los índices seleccionados
    List<int> selectedCardIndices = [];
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return FilterDialog(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 680,
            title: "Editar filtro de busqueda",
            btnText: "Seleccionar",
            filters: [
              Divider(color: Colors.red[900], thickness: 2),
              SizedBox(
                height: 380, // Ajusta la altura según tu diseño.
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(6, (index) {
                      return CardAutopartMin(
                        isChecked: selectedCardIndices.contains(
                            index), // Verificar si el índice está en la lista
                        onTap: () {
                          setState(() {
                            if (selectedCardIndices.contains(index)) {
                              selectedCardIndices.remove(
                                  index); // Desmarcar si ya estaba seleccionado
                            } else {
                              selectedCardIndices.add(
                                  index); // Marcar si no estaba seleccionado
                            }
                          });
                        },
                      );
                    }),
                  ),
                ),
              ),
              Divider(color: Colors.red[900], thickness: 2),
              const SizedBox(height: 20),
              InputDefault(
                label: "Codigo de autoparte",
                controller: _inputManager.getController("code"),
                icon: Icons.keyboard_alt,
              ),
            ],
          );
        });
      },
    );
  }
}
