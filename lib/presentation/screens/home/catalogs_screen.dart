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
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnImgDev(
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width * 0.45 - 50,
                  heigth: MediaQuery.of(context).size.height * 0.25 - 50,
                  img: "catalogo1.png",
                ),
                BtnImgDev(
                  onPressed: () {},
                  width: MediaQuery.of(context).size.width * 0.45 - 50,
                  heigth: MediaQuery.of(context).size.height * 0.25 - 50,
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