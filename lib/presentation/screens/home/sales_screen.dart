import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_sale.dart';
import 'package:san_andres_mobile/presentation/widgets/dialogs/filter_dialog.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/DropdownFieldDev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_date_dev.dart';

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            CardSale(),
            CardSale(),
            CardSale(),
            CardSale(),
            CardSale(),
            CardSale(),
            CardSale(),
            CardSale(),
            CardSale(),
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
                      _showFilterDialog(context);
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

  _showFilterDialog(BuildContext context) {
    List<String> categoriesCar = [
      "TODOS",
      "CLIENTE 1",
      "CLIENTE 2",
      "CLIENTE 3",
    ];
    return showDialog(
      context: context,
      builder: (context) {
        return FilterDialog(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.48,
          title: "Editar filtro de busqueda",
          filters: [
            DropdownFieldDev(
              items: categoriesCar,
              text: "Selecciona una opción",
              width: MediaQuery.of(context).size.width * 0.67,
              label: "Seleccionar por cliente",
              icon: CupertinoIcons.person_2_alt,
              value: valueManagerString.getNotifier('category_car'),
            ),
            InputDateDev(
              label: "Fecha inicial de busqueda",
              widthDay: 95,
              widthMonth: 155,
              widthYear: 110,
              dropdownDay: valueManagerInt.getNotifier('init_date_day'),
              dropdownMonth: valueManagerString.getNotifier('init_date_month'),
              dropdownYear: valueManagerInt.getNotifier('init_date_year'),
            ),
            InputDateDev(
              label: "Fecha maxima de busqueda",
              widthDay: 95,
              widthMonth: 155,
              widthYear: 110,
              dropdownDay: valueManagerInt.getNotifier('last_date_day'),
              dropdownMonth: valueManagerString.getNotifier('last_date_month'),
              dropdownYear: valueManagerInt.getNotifier('last_date_year'),
            ),
          ],
        );
      },
    );
  }
}
