import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_provider.dart';
import 'package:san_andres_mobile/presentation/screens/autoparts/autoparts_global.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_min.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/presentation/widgets/snackbars/custom_snackbar.dart';

class AddAutopartsPage extends StatefulWidget {
  static String name = "add_autoparts_page";
  const AddAutopartsPage({super.key});

  @override
  State<AddAutopartsPage> createState() => _AddAutopartsPageState();
}

class _AddAutopartsPageState extends State<AddAutopartsPage> {
  final InputControllerManager _inputManager = InputControllerManager();
  final valueManagerString = ValueNotifierManager<String?>();
  AutopartList? _selectedAutopart;
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
            label: "Costo unitario (privado)",
            controller: _inputManager.getController('cost_unit'),
            icon: Icons.money,
            type: TextInputType.number,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo unitario (publico)",
            controller: _inputManager.getController('cost_unit_public'),
            icon: Icons.public,
            type: TextInputType.number,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo por mayor (privado)",
            controller: _inputManager.getController('cost_wholesale'),
            icon: Icons.money,
            type: TextInputType.number,
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Costo por mayor (publico)",
            controller: _inputManager.getController('cost_wholesale_public'),
            icon: Icons.public,
            type: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Ninguno elegido",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          if (_selectedAutopart != null) ...[
            CardAutopartMin(
              isChecked: true,
              autopart: _selectedAutopart!,
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
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
              onPressed: () async {
                final autopartProvider =
                    Provider.of<AutopartProvider>(context, listen: false);

                if (_selectedAutopart == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Debe seleccionar un autoparte")),
                  );
                  return;
                }

                try {
                  // Parsear valores de los inputs
                  final unitPrice = double.tryParse(
                          _inputManager.getController('cost_unit').text) ??
                      0.0;
                  final unitPricePublic = double.tryParse(_inputManager
                          .getController('cost_unit_public')
                          .text) ??
                      0.0;
                  final amountUnit = int.tryParse(
                          _inputManager.getController('cost_wholesale').text) ??
                      0;
                  final amountUnitPublic = int.tryParse(_inputManager
                          .getController('cost_wholesale_public')
                          .text) ??
                      0;

                  // Crear instancia para enviar
                  final newAutopartSeller = AutopartOfSeller(
                    id: 0, // id no importa, será autogenerado
                    autopartId: _selectedAutopart!.id,
                    sellerId: 1,
                    amountUnit: amountUnit,
                    amountUnitPublic: amountUnitPublic,
                    unitPrice: unitPrice,
                    unitPricePublic: unitPricePublic,
                  );

                  // Llamar al provider para crear
                  final created = await autopartProvider
                      .createAutopartSeller(newAutopartSeller);

                  // Mostrar mensaje de éxito
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text("Autoparte creada con ID: ${created.id}")),
                  );

                  // Opcional: limpiar formulario o navegar
                  setState(() {
                    _selectedAutopart = null;
                  });

                  // ignore: use_build_context_synchronously
                  context.push("/home");
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error al crear autoparte: $e")),
                  );
                }
              },
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

  Future<void> _showFilterDialog(BuildContext context) async {
    final autopartProvider =
        Provider.of<AutopartProvider>(context, listen: false);

    // Cargar autopartes primero
    await autopartProvider.loadAutopartsGlobal();

    if (autopartProvider.autoparts.isEmpty) return;

    CustomSnackbar.show(
      // ignore: use_build_context_synchronously
      context: context,
      // ignore: use_build_context_synchronously
      height: MediaQuery.of(context).size.height * 0.65,
      content: const AutopartsGlobal(),
    );
  }
}
