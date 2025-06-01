import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_client.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            CardClient(),
            CardClient(),
            CardClient(),
            CardClient(),
            CardClient(),
            CardClient(),
            CardClient(),
          ],
        ),
        if (_isExpanded)
          GestureDetector(
            onTap: _toggleExpand,
            child: Container(
              color: const Color.fromARGB(60, 88, 67, 67),
              width: double.infinity,
              height: double.infinity,
            ),
          ),Align(
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
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                    BtnFloatDev(
                      icon: Icons.search_off_sharp,
                      text: "Filtro",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 20),
                  ],
                  // FAB principal para expandir o contraer
                  stateOptions
                      ? BtnFloatDev(
                          text: "",
                          onPressed: _toggleExpand,
                          bg: Colors.red[900],
                          icon: _isExpanded ? Icons.close : Icons.keyboard_arrow_up_rounded,
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