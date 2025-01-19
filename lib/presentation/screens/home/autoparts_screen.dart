import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/shared/data/autoparts_data.dart';
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
      padding: const EdgeInsets.all(0),
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

  final InputControllerManager _inputManager = InputControllerManager();
  final valueManagerInt = ValueNotifierManager<int?>();
  @override
  Widget build(BuildContext context) {
    double widthInput = MediaQuery.of(context).size.width * 0.85;
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        children: [
          DropdownFieldDev(
            items: AutopartsData.getCarCategories(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Categoria de mobilidad",
            icon: Icons.category_outlined,
            value: valueManagerInt.getNotifier('category_car'),
          ),
          DropdownFieldDev(
            items: AutopartsData.getCarBrands(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Marca de mobilidad",
            icon: Icons.branding_watermark_rounded,
            value: valueManagerInt.getNotifier('brand_car'),
          ),
          DropdownFieldDev(
            items: AutopartsData.getCars(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Vehiculo",
            icon: CupertinoIcons.car,
            value: valueManagerInt.getNotifier('car'),
          ),
          DropdownFieldDev(
            items: AutopartsData.getAutopartsCategories(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Categoria de repuesto",
            icon: Icons.category,
            value: valueManagerInt.getNotifier('category_autopart'),
          ),
          DropdownFieldDev(
            items: AutopartsData.getAutopartBrands(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Marca de repuesto",
            icon: Icons.branding_watermark,
            value: valueManagerInt.getNotifier('brand_autopart'),
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
            width: MediaQuery.of(context).size.width * 0.9,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
