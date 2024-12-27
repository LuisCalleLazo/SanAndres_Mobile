import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/dialogs/filter_dialog.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/DropdownFieldDev.dart';
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
            text: "Elija el autoparte",
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
    double heigthFil = 20;
    List<String> categoriesAutopart = [
      "TODOS",
      "AMORTIGUADORES",
      "JUNTAS",
      "GRASAS",
      "RODAMIENTOS",
      "MUÑONES",
      "FILTROS",
      "FRENOS",
      "DISCOS DE PRENSA",
    ];
    List<String> brandAutopart = [
      "TODOS",
      "YOITOKI",
      "ICHIBAN",
      "NISSAN",
    ];
    List<String> categoriesCar = [
      "TODOS",
      "LIGEROS",
      "MOTOCICLETAS",
      "CARGA LIGERA",
      "CARGA PESADA",
      "AGRICOLA Y DE CONSTRUCCION",
      "TRANSPORTE MASIVO",
      "RECREATIVO",
    ];
    List<String> brandCar = [
      "TODOS",
      "YOITOKI",
      "ICHIBAN",
      "NISSAN",
    ];
    return showDialog(
      context: context,
      builder: (context) {
        return FilterDialog(
          title: "Editar filtro de busqueda",
          filters: [
            InputDefault(
              label: "Codigo de autoparte",
              controller: _inputManager.getController("code"),
              icon: Icons.keyboard_alt,
            ),
            DropdownFieldDev(
              items: categoriesAutopart,
              text: "Selecciona una opción",
              width: MediaQuery.of(context).size.width * 0.67,
              label: "Categoria de repuesto",
              icon: Icons.category,
              value: valueManagerString.getNotifier('category_autopart'),
            ),
            DropdownFieldDev(
              items: brandAutopart,
              text: "Selecciona una opción",
              width: MediaQuery.of(context).size.width * 0.67,
              label: "Marca de repuesto",
              icon: Icons.category,
              value: valueManagerString.getNotifier('brand_autopart'),
            ),
            DropdownFieldDev(
              items: categoriesCar,
              text: "Selecciona una opción",
              width: MediaQuery.of(context).size.width * 0.67,
              label: "Categoria de mobilidad",
              icon: Icons.category,
              value: valueManagerString.getNotifier('category_car'),
            ),
            DropdownFieldDev(
              items: brandCar,
              text: "Selecciona una opción",
              width: MediaQuery.of(context).size.width * 0.67,
              label: "Marca de mobilidad",
              icon: Icons.category,
              value: valueManagerString.getNotifier('brand_car'),
            ),
          ],
        );
      },
    );
  }
}
