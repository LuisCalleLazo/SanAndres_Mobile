import 'package:flutter/material.dart';

class BtnTextDefault extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? heigth;
  final double? fontSize;
  final Color color;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  const BtnTextDefault({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 300.0,
    this.heigth = 60,
    this.fontSize = 18,
    this.color = Colors.red,
    this.minWidth = 200.0,
    this.maxWidth = 350.0,
    this.minHeight = 50.0,
    this.maxHeight = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
            padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
            width: width,
            height: heigth,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: "",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
