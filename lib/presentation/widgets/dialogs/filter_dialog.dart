import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';

class FilterDialog extends StatelessWidget {
  final String title;
  final String btnText;
  final double height;
  final double width;
  final List<Widget> filters;
  final VoidCallback? onApply;

  const FilterDialog({
    super.key,
    this.title = "Editar filtro de busqueda",
    required this.filters,
    required this.height,
    required this.width,
    this.btnText = "Aplicar",
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 20,
                ),
              ),
            ),
            Column(children: filters),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: BtnTextDefault(
                heigth: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                text: btnText,
                onPressed: () {
                  if (onApply != null) {
                    onApply!();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
