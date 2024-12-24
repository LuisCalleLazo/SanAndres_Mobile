import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_img_dev.dart';

class CatalogsScreen extends StatelessWidget {
  const CatalogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
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
                  img: "catalogo1.png",
                ),
                BtnImgDev(
                  onPressed: () {},
                  width: 180,
                  heigth: 180,
                  img: "catalogo2.png",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}