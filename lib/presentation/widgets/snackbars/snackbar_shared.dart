import 'package:flutter/material.dart';

class SnackbarShared extends StatelessWidget {
  const SnackbarShared({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.20, // Ocupa toda la altura de la pantalla
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 50),
                const Text(
                  "Compartir",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: IconButton.filled(
                    color: Colors.black,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.amber),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            width: double.infinity,
            color: Colors.transparent,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.whatshot,
                  size: 40,
                ),
                Icon(
                  Icons.face,
                  size: 40,
                ),
                Icon(
                  Icons.telegram,
                  size: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
