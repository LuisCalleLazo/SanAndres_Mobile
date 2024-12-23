import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Container(
        color: Colors.transparent,
        height: 300,
        child: TextField(
          style: const TextStyle(
            height: 1.3,
            fontSize: 21,
          ),
          cursorColor: const Color.fromRGBO(255, 179, 0, 1),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 30,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
                width: 2.0,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
                width: 2.0, // Ajusta el grosor del borde inferior
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
                width: 2.0, // Ajusta el grosor del borde inferior
              ),
            ),
            contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0),
          ),
        ),
      ),
    );
  }
}
