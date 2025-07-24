import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_provider.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_min.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';

class AutopartsGlobal extends StatefulWidget {
  const AutopartsGlobal({super.key});

  @override
  State<AutopartsGlobal> createState() => _AutopartsGlobalState();
}

class _AutopartsGlobalState extends State<AutopartsGlobal> {
  late List<AutopartList> filteredAutoparts;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final autopartProvider = Provider.of<AutopartProvider>(context, listen: false);
    filteredAutoparts = List.from(autopartProvider.autoparts);
  }

  void filterByCode(String code) {
    setState(() {
      final autopartProvider = Provider.of<AutopartProvider>(context, listen: false);
      filteredAutoparts = autopartProvider.autoparts.where((autopart) {
        final codeValue = autopart.info
            .firstWhere(
              (info) => info.type == 'code',
              orElse: () => AutopartInfoList(type: 'code', value: ''),
            )
            .value
            .toLowerCase();
        return codeValue.contains(code.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Consumer<AutopartProvider>(
          builder: (context, provider, _) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Productos globales",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    ),
                  ),
                  Divider(color: Colors.red[900], thickness: 2),
                  InputDefault(
                    label: "Código de autoparte",
                    controller: _searchController,
                    icon: Icons.keyboard_alt,
                    onChanged: filterByCode,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(filteredAutoparts.length, (index) {
                          final autopart = filteredAutoparts[index];
                          return CardAutopartMin(
                            isChecked: provider.selectedAutopart == autopart,
                            onTap: () {
                              provider.selectAutopart(
                                  provider.selectedAutopart == autopart
                                      ? null
                                      : autopart);
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                            autopart: autopart,
                          );
                        }),
                      ),
                    ),
                  ),
                  Divider(color: Colors.red[900], thickness: 2),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: const Text("Seleccionar",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}