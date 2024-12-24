import 'package:flutter/material.dart';

class BtnImgDev extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? heigth;
  final Color color;
  final IconData icon;
  final String img;
  final String? text;
  final double circular;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  const BtnImgDev({
    super.key,
    required this.onPressed,
    required this.img,
    this.width = 300.0,
    this.heigth = 60,
    this.color = Colors.transparent,
    this.icon = Icons.add,
    this.minWidth = 50.0,
    this.maxWidth = 200.0,
    this.minHeight = 30.0,
    this.maxHeight = 100.0,
    this.text = "",
    this.circular = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
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
                borderRadius: BorderRadius.circular(circular),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/imgs/$img',
                fit: BoxFit.contain, // Opcional: cómo ajustar la imagen
              ),
              if (text != null && text!.isNotEmpty) // Comprueba si hay texto
                Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ), // Estilo opcional
                ),
            ],
          ),
        ),
      ),
    );
  }
}
