import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_min.dart';
import 'package:san_andres_mobile/presentation/widgets/dialogs/filter_dialog.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';

class AddAutopartsPage extends StatefulWidget {
  static String name = "add_autoparts_page";
  const AddAutopartsPage({super.key});

  @override
  State<AddAutopartsPage> createState() => _AddAutopartsPageState();
}

class _AddAutopartsPageState extends State<AddAutopartsPage> {
  final InputControllerManager _inputManager = InputControllerManager();
  final valueManagerString = ValueNotifierManager<String?>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar nuevo autoparte"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo unitario oficial",
            controller: _inputManager.getController('cost_unit'),
            icon: Icons.money,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo unitario publico",
            controller: _inputManager.getController('cost_unit_public'),
            icon: Icons.public,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo por mayor oficial",
            controller: _inputManager.getController('cost_wholesale'),
            icon: Icons.money,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo por mayor publico",
            controller: _inputManager.getController('cost_wholesale_public'),
            icon: Icons.public,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Cantidad disponible oficial",
            controller: _inputManager.getController('amount_wholesale_public'),
            icon: Icons.list_alt,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Cantidad disponible publico",
            controller: _inputManager.getController('amount_wholesale_public'),
            icon: Icons.list,
          ),
          const SizedBox(height: 20),
          BtnTextDefault(
            width: MediaQuery.of(context).size.width * 0.8,
            maxWidth: MediaQuery.of(context).size.width,
            text: "Elija el producto",
            onPressed: () {
              _showFilterDialog(context);
            },
          ),
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

  _showFilterDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return FilterDialog(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 680,
          title: "Editar filtro de busqueda",
          btnText: "Seleccionar",
          filters: [
            Divider(color: Colors.red[900], thickness: 2),
            const SizedBox(
              height: 380, // Ajusta la altura según tu diseño.
              child: SingleChildScrollView(
                child: Column(  
                  children: [
                    CardAutopartMin(),
                    CardAutopartMin(),
                    CardAutopartMin(),
                    CardAutopartMin(),
                    CardAutopartMin(),
                    CardAutopartMin(),
                  ],
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
      },
    );
  }
}
