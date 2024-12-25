import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:san_andres_mobile/presentation/screens/home/autoparts_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/catalogs_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/clients_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/reports_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/sales_screen.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_icon_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/navigation/navigation.dart';

class HomePage extends StatefulWidget {
  static String name = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const AutopartsScreen(),
    const SalesScreen(),
    const ReportsScreen(),
    const CatalogsScreen(),
    const ClientsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: BtnIconDev(
              icon: Icons.menu,
              width: 50,
              heigth: 50,
              color: Colors.white,
              onPressed: _toggleMenu,
            ),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "BIENVENIDO    AL    SISTEMA    A.S.A",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.sairaStencilOne(
                      fontSize: 20, color: Colors.red[900]),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _screens,
          ),
          bottomNavigationBar: Navigation(
            onItemTapped: _onItemTapped,
            selectedIndex: _selectedIndex,
          ),
        ),
          if (_isMenuVisible)
            GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
        if (_isMenuVisible)
          Positioned(
            top: 0,
            left: 0,
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% de la pantalla
            height: MediaQuery.of(context).size.height, // Toda la altura
            child: _buildMenu(),
          ),
      ],
    );
  }

  Widget _buildMenu() {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.red[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // Espaciado para la barra de estado
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                "Inicio",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.white),
              title: const Text(
                "Editar informacion de perfil",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Acción al presionar
                _toggleMenu();
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.thirteen_mp_rounded, color: Colors.white),
              title: const Text(
                "Tema",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Acción al presionar
                _toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                "Configuración",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Acción al presionar
                _toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.white),
              title: const Text(
                "Ayuda",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Acción al presionar
                _toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                "Información de la aplicación",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Acción al presionar
                _toggleMenu();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                "Cerrar sesión",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                context.pop();
                _toggleMenu();
              },
            ),
          ],
        ),
      ),
    );
  }


  Future<bool?> _showFilterDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content:
              const Text('¿Estás seguro de que quieres eliminar esta imagen?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.blue[700]),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
          ],
        );
      },
    );
  }
}
