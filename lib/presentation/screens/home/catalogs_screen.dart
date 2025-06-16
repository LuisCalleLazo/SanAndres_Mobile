import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_img_dev.dart';

class CatalogsScreen extends StatelessWidget {
  const CatalogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthBtn = MediaQuery.of(context).size.width * 0.5 - 50;
    double heightBtn = MediaQuery.of(context).size.height * 0.25;
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
                  onPressed: () {
                    context.push("/reports/catalog");
                  },
                  width: widthBtn,
                  heigth: heightBtn,
                  img: "catalogo1.png",
                ),
                // BtnImgDev(
                //   onPressed: () {},
                //   width: widthBtn,
                //   heigth: heightBtn,
                //   img: "catalogo2.png",
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}