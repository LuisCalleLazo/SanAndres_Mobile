import 'package:flutter/material.dart';

class DialogEmpty extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const DialogEmpty({
    super.key,
    required this.height,
    required this.child,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
