import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';

class FilterDialog extends StatelessWidget {
  final String title;
  final List<Widget> filters;

  const FilterDialog({super.key, required this.title, required this.filters});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Editar filtro de busqueda",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 18,
                ),
              ),
            ),
            Column(children: filters),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: BtnTextDefault(
                heigth: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                text: "Aplicar",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
