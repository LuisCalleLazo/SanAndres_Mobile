import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_sale.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_field_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_date_dev.dart';
import 'package:san_andres_mobile/shared/data/autoparts_data.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final valueManagerString = ValueNotifierManager<String?>();
  final valueManagerInt = ValueNotifierManager<int?>();
  bool _isExpanded = false;
  late bool stateOptions;
  // _loadData() {}

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
      content: SnackbarSaleFilter(),
      duration: const Duration(hours: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            CardSale(),
            CardSale(),
            CardSale(),
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
                      context.push('/sales/add');
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
    );
  }
}

class SnackbarSaleFilter extends StatelessWidget {
  SnackbarSaleFilter({super.key});
  final valueManagerString = ValueNotifierManager<String?>();
  final valueManagerInt = ValueNotifierManager<int?>();

  @override
  Widget build(BuildContext context) {
    double widthInput = MediaQuery.of(context).size.width * 0.85;
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: ListView(
        children: [
          DropdownFieldDev(
            items: AutopartsData.getAutopartsCategories(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Seleccionar por producto",
            icon: Icons.production_quantity_limits_sharp,
            value: valueManagerInt.getNotifier('category_car'),
          ),
          DropdownFieldDev(
            items: AutopartsData.getAutopartsCategories(),
            text: "Selecciona una opción",
            width: widthInput,
            label: "Seleccionar por cliente",
            icon: Icons.person_sharp,
            value: valueManagerInt.getNotifier('category_car'),
          ),
          InputDateDev(
            label: "Fecha inicial de busqueda",
            dropdownDay: valueManagerInt.getNotifier('init_date_day'),
            dropdownMonth: valueManagerString.getNotifier('init_date_month'),
            dropdownYear: valueManagerInt.getNotifier('init_date_year'),
          ),
          InputDateDev(
            label: "Fecha maxima de busqueda",
            dropdownDay: valueManagerInt.getNotifier('last_date_day'),
            dropdownMonth: valueManagerString.getNotifier('last_date_month'),
            dropdownYear: valueManagerInt.getNotifier('last_date_year'),
          ),
          const SizedBox(height: 30),
          BtnTextDefault(
            text: "Aplicar filtro",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
