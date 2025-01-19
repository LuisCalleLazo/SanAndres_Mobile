import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_add_sale.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_select_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_date_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

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

  List<SelectItems> items = [];
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
          const SizedBox(height: 20),
          InputDefault(
            label: "Cliente no registrado",
            controller: _inputManager.getController(""),
            icon: CupertinoIcons.person_alt_circle_fill,
          ),
          const SizedBox(height: 20),
          DropdownFieldDev(
            width: MediaQuery.of(context).size.width * 0.9,
            items: <SelectItems>[
              SelectItems(id: 1, label: "Cliente 1"),
              SelectItems(id: 2, label: "Cliente 2"),
              SelectItems(id: 3, label: "Cliente 3"),
            ],
            label: "Seleccione un cliente registrado",
            text: "Clientes registrados",
            value: valueManagerInt.getNotifier('client_register'),
            icon: CupertinoIcons.person_2_fill,
          ),
          const SizedBox(height: 20),
          DropdownSelectDev(
            items: items,
            selectedId: valueManagerInt.getNotifier("name"),
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.red[900], thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "10 000 Bs",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.red[900], thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnTextDefault(
                  color: Colors.red[900],
                  width: 100,
                  heigth: 50,
                  minHeight: 30,
                  text: "Guardar",
                  onPressed: () {
                    context.pop();
                  },
                ),
                BtnTextDefault(
                  heigth: 50,
                  width: 100,
                  minHeight: 30,
                  text: "Cancelar",
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
