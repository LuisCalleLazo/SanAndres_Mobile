import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/DropdownFieldDev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AutopartsScreen extends StatefulWidget {
  const AutopartsScreen({super.key});

  @override
  State<AutopartsScreen> createState() => _AutopartsScreenState();
}

class _AutopartsScreenState extends State<AutopartsScreen> {
  bool _isExpanded = false;
  late bool stateOptions;
  // bool _isDataLoaded = false;

  _loadData() {}
  @override
  void initState() {
    super.initState();
    stateOptions = true;
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _showSnackbarFilter(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      backgroundColor: Colors.white,
      content: SnackbarFilter(),
      duration: const Duration(hours: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("AutopartsScreen"),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          _loadData();
        }
      },
      child: Stack(
        children: [
          ListView(
            children: const [
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
              CardAutopart(
                productId: 1,
                productCode: "wedwed-234n",
                productPrice: 232.4,
              ),
            ],
          ),
          if (_isExpanded)
            GestureDetector(
              onTap: _toggleExpand,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_isExpanded) ...[
                    BtnFloatDev(
                      icon: Icons.add,
                      text: "Agregar",
                      onPressed: () {
                        context.push('/autoparts/add');
                      },
                    ),
                    const SizedBox(height: 20),
                    BtnFloatDev(
                      icon: Icons.search_off_sharp,
                      text: "Filtro",
                      onPressed: () {
                        _showSnackbarFilter(context);
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                  // FAB principal para expandir o contraer
                  stateOptions
                      ? BtnFloatDev(
                          text: "",
                          onPressed: _toggleExpand,
                          bg: Colors.red[900],
                          icon: _isExpanded
                              ? Icons.close
                              : Icons.keyboard_arrow_up_rounded,
                        )
                      : const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackbarFilter extends StatelessWidget {
  SnackbarFilter({super.key});
  final List<String> categoriesAutopart = [
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
  final List<String> brandAutopart = [
    "TODOS",
    "YOITOKI",
    "ICHIBAN",
    "NISSAN",
  ];
  final List<String> categoriesCar = [
    "TODOS",
    "LIGEROS",
    "MOTOCICLETAS",
    "CARGA LIGERA",
    "CARGA PESADA",
    "AGRICOLA Y DE CONSTRUCCION",
    "TRANSPORTE MASIVO",
    "RECREATIVO",
  ];
  final List<String> brandCar = [
    "TODOS",
    "YOITOKI",
    "ICHIBAN",
    "NISSAN",
  ];

  final InputControllerManager _inputManager = InputControllerManager();
  final valueManagerString = ValueNotifierManager<String?>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        children: [
          DropdownFieldDev(
            items: categoriesCar,
            text: "Selecciona una opción",
            width: MediaQuery.of(context).size.width * 0.72,
            label: "Categoria de mobilidad",
            icon: Icons.category_outlined,
            value: valueManagerString.getNotifier('category_car'),
          ),
          DropdownFieldDev(
            items: brandCar,
            text: "Selecciona una opción",
            width: MediaQuery.of(context).size.width * 0.72,
            label: "Marca de mobilidad",
            icon: Icons.branding_watermark_rounded,
            value: valueManagerString.getNotifier('brand_car'),
          ),
          DropdownFieldDev(
            items: brandCar,
            text: "Selecciona una opción",
            width: MediaQuery.of(context).size.width * 0.72,
            label: "Vehiculo",
            icon: CupertinoIcons.car,
            value: valueManagerString.getNotifier('car'),
          ),
          DropdownFieldDev(
            items: categoriesAutopart,
            text: "Selecciona una opción",
            width: MediaQuery.of(context).size.width * 0.72,
            label: "Categoria de repuesto",
            icon: Icons.category,
            value: valueManagerString.getNotifier('category_autopart'),
          ),
          DropdownFieldDev(
            items: brandAutopart,
            text: "Selecciona una opción",
            width: MediaQuery.of(context).size.width * 0.72,
            label: "Marca de repuesto",
            icon: Icons.branding_watermark,
            value: valueManagerString.getNotifier('brand_autopart'),
          ),
          const SizedBox(height: 20),
          InputDefault(
            label: "Codigo de autoparte",
            controller: _inputManager.getController("code"),
            icon: Icons.keyboard_alt,
          ),
          const SizedBox(height: 30),
          BtnTextDefault(
            text: "Aplicar filtro",
            onPressed: () {},
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
