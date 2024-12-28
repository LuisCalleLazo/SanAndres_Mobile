import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_icon_dev.dart';

class CardAutopartMin extends StatefulWidget {
  const CardAutopartMin({super.key});

  @override
  State<CardAutopartMin> createState() => _CardAutopartMinState();
}

class _CardAutopartMinState extends State<CardAutopartMin> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked; // Cambiar el estado al hacer clic
        });
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Stack(
          children: [
            Container(
              height: 120,
              color: Colors.white60,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
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
                  BtnIconDev(
                    onPressed: () {
                      context.push('/autoparts/imgs');
                    },
                    width: 25,
                    heigth: 50,
                    minHeight: 20,
                    minWidth: 20,
                    icon: Icons.image,
                  ),
                ],
              ),
            ),
            if (_isChecked)
              const Positioned(
                right: 10,
                top: 10,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.red,
                  size: 30,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
