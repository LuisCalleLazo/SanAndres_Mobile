import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';

class EditAudtopartsPage extends StatefulWidget {
  static String name = "edit_autoparts_page";

  const EditAudtopartsPage({super.key});

  @override
  State<EditAudtopartsPage> createState() => _EditAudtopartsPageState();
}

class _EditAudtopartsPageState extends State<EditAudtopartsPage> {
  final InputControllerManager _inputManager = InputControllerManager();

  final valueManagerString = ValueNotifierManager<String?>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar información de autoparte"),
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
