import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';

class Navigation extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  final int selectedIndex;
  const Navigation(
      {super.key, required this.onItemTapped, required this.selectedIndex});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  late AuthProvider authProvider;
  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final isSeller = authProvider.seller ?? false;
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      // ignore: deprecated_member_use
      unselectedItemColor: Colors.red[900]?.withOpacity(0.3),
      selectedItemColor: Colors.red[900],
      items: <BottomNavigationBarItem>[
        if (isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Autopartes',
            backgroundColor: Colors.white,
          ),
        if (isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.work_history_sharp),
            label: 'Ventas',
            backgroundColor: Colors.white,
          ),
        if (isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Reportes',
            backgroundColor: Colors.white,
          ),
        if (isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Catalogos',
            backgroundColor: Colors.white,
          ),
        if (isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Clientes',
            backgroundColor: Colors.white,
          ),
        if (!isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Autopartes',
            backgroundColor: Colors.white,
          ),
        if (!isSeller)
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
            backgroundColor: Colors.white,
          ),
      ],
      onTap: widget.onItemTapped,
      currentIndex: widget.selectedIndex,
    );
  }
}
