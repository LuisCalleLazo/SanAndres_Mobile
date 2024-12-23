import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:san_andres_mobile/presentation/widgets/text/text_decoration_dev.dart';

class CardSale extends StatelessWidget {
  const CardSale({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Container(
          height: 140,
          color: Colors.white60,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      'https://picsum.photos/id/1/600/250',
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Jose Luis Lazo Nina",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fecha",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("2024 / 10 /12")
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("200 Bs")
                      ],
                    ),
                    TextDecorationDev(
                      bg: Colors.orange[300],
                      text: "Pendiente",
                      width: (MediaQuery.of(context).size.width * 0.5) - 30,
                    ),
                    TextDecorationDev(
                      bg: Colors.green[300],
                      text: "Cancelado",
                      width: (MediaQuery.of(context).size.width * 0.5) - 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
