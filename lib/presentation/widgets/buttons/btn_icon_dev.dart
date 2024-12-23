import 'package:flutter/material.dart';

class BtnIconDev extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? heigth;
  final double padd;
  final Color color;
  final IconData icon;
  const BtnIconDev({
    super.key,
    required this.onPressed,
    this.width = 300.0,
    this.heigth = 60,
    this.padd = 10,
    this.color = Colors.amber,
    this.icon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(vertical: padd),
          width: width,
          height: heigth,
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
