import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
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
                dropdownMonth:
                    valueManagerString.getNotifier('date_month_last'),
                dropdownYear: valueManagerInt.getNotifier('date_year_last'),
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo por unidad",
            type: TextInputType.number,
            controller: _inputManager.getController('cost_unit'),
            icon: Icons.public,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Cantidad por unidad",
            type: TextInputType.number,
            controller: _inputManager.getController('amount_unit'),
            icon: Icons.public,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo al por mayor",
            type: TextInputType.number,
            controller: _inputManager.getController('cost_wholesale'),
            icon: Icons.money,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Cantidad al por mayor",
            type: TextInputType.number,
            controller: _inputManager.getController('amount_wholesale'),
            icon: Icons.public,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: BtnTextDefault(
              onPressed: () {},
              color: Colors.red[900],
              text: "Guardar",
              width: MediaQuery.of(context).size.width * 0.8,
              maxWidth: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
