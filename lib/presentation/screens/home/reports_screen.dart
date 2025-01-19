import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_img_dev.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthBtn = MediaQuery.of(context).size.width * 0.5 - 50;
    double heightBtn = MediaQuery.of(context).size.height * 0.25;
    return ListView(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnImgDev(
                  onPressed: () {},
                  width: widthBtn,
                  heigth: heightBtn,
                  img: "cotizacion.png",
                  text: "Generar Cotizaciones",
                ),
                BtnImgDev(
                  onPressed: () {},
                  width: widthBtn,
                  heigth: heightBtn,
                  img: "estadisticas.png",
                  text: "Productos mas Vendidos",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnImgDev(
                  onPressed: () {},
                  width: widthBtn,
                  heigth: heightBtn,
                  img: "estadisticas2.png",
                  text: "Ganancias Netas",
                ),
                BtnImgDev(
                  onPressed: () {},
                  width: widthBtn,
                  heigth: heightBtn,
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
