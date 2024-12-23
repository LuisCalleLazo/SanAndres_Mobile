import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;
  const Navigation(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: Colors.red,
      selectedItemColor: Colors.red[800],
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.storage),
          label: 'Autopartes',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_history_sharp),
          label: 'Ventas',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner),
          label: 'Reportes',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_document),
          label: 'Catalogos',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      ],
      onTap: onItemTapped,
      currentIndex: selectedIndex,
    );
  }
}
