import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_img_dev.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          child: SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnImgDev(
                  onPressed: () {},
                  width: 180,
                  heigth: 180,
                  img: "cotizacion.png",
                  text: "Generar Cotizaciones",
                ),
                BtnImgDev(
                  onPressed: () {},
                  width: 180,
                  heigth: 180,
                  img: "estadisticas.png",
                  text: "Productos mas Vendidos",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          child: SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnImgDev(
                  onPressed: () {},
                  width: 180,
                  heigth: 180,
                  img: "estadisticas2.png",
                  text: "Ganancias Netas",
                ),
                BtnImgDev(
                  onPressed: () {},
                  width: 180,
                  heigth: 180,
                  img: "ganancias.png",
                  text: "Ventas por Cliente",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
