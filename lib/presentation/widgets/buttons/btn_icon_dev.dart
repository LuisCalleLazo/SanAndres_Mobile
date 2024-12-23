import 'package:flutter/material.dart';

class BtnIconDev extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? heigth;
  final double padd;
  final Color color;
  final IconData icon;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  const BtnIconDev({
    super.key,
    required this.onPressed,
    this.width = 300.0,
    this.heigth = 60,
    this.padd = 10,
    this.color = Colors.red,
    this.icon = Icons.add,
    this.minWidth = 50.0,
    this.maxWidth = 150.0,
    this.minHeight = 30.0,
    this.maxHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight ?? 0,
          maxHeight: maxHeight ?? double.infinity,
        ),
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
            width: width,
            height: heigth,
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
