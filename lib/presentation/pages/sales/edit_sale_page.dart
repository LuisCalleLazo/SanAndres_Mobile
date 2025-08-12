import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_min.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_edit_sale.dart';
import 'package:san_andres_mobile/presentation/widgets/dialogs/filter_dialog.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_date_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

class EditSalePage extends StatefulWidget {
  static String name = "edit_sale_page";
  const EditSalePage({super.key});

  @override
  State<EditSalePage> createState() => _EditSalePageState();
}

class _EditSalePageState extends State<EditSalePage> {
  final InputControllerManager _inputManager = InputControllerManager();

  final valueManagerString = ValueNotifierManager<String?>();
  final valueManagerInt = ValueNotifierManager<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar venta"),
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
          DropdownFieldDev(
            width: MediaQuery.of(context).size.width * 0.83,
            items: <SelectItems>[
              SelectItems(id: 1, label: "Cliente 1"),
              SelectItems(id: 2, label: "Cliente 2"),
              SelectItems(id: 3, label: "Cliente 3"),
            ],
            label: "Seleccione un cliente registrado",
            text: "Clientes registrados",
            value: valueManagerInt.getNotifier('client_register'),
            icon: CupertinoIcons.person_2_fill,
            pV: 20,
          ),
          const SizedBox(height: 20),
          BtnTextDefault(
            width: MediaQuery.of(context).size.width - 100,
            maxWidth: MediaQuery.of(context).size.width - 10,
            text: "Agregar productos",
            onPressed: () {
              _showSelectDialog(context);
            },
          ),
          const SizedBox(height: 20),
          Divider(color: Colors.red[900], thickness: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(6, (index) {
                  return const CardEditSale();
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
                ),
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
                  width: MediaQuery.of(context).size.width * 0.5 - 70,
                  minWidth: 50,
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                  heigth: 50,
                  minHeight: 30,
                  text: "Guardar",
                  onPressed: () {
                    context.pop();
                  },
                ),
                BtnTextDefault(
                  width: MediaQuery.of(context).size.width * 0.5 - 70,
                  minWidth: 50,
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
                  heigth: 50,
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
                height: 380,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(6, (index) {
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
                        autopart: AutopartList(
                            id: 1,
                            infos: [],
                            categoryName: "",
                            name: '',
                            categoryId: 0,
                            brandId: 0,
                            brandName: '',
                            assets: []),
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
