import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;
  const Navigation(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: Colors.red[900]?.withOpacity(0.3),
      selectedItemColor: Colors.red[900],
      items: const <BottomNavigationBarItem>[
       BottomNavigationBarItem(
          icon: Icon(Icons.storage),
          label: 'Autopartes',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_history_sharp),
          label: 'Ventas',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner),
          label: 'Reportes',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_document),
          label: 'Catalogos',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_rounded),
          label: 'Clientes',
          backgroundColor: Colors.white,
        ),
      ],
      onTap: widget.onItemTapped,
      currentIndex: widget.selectedIndex,
    );
  }
}
