import 'package:flutter/material.dart';

class CardAutopartMin extends StatelessWidget {
  const CardAutopartMin({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Container(
          height: 80,
          color: Colors.white60,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Código:",
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "8238-yh81",
                style: TextStyle(color: Colors.grey[900]),
              ),
              Text(
                "Categiria",
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Amortiguador",
                style: TextStyle(color: Colors.grey[900]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
