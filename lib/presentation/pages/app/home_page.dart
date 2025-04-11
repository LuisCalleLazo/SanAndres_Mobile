import 'package:flutter/cupertino.dart';
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
            toolbarHeight: 40,
            // backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: BtnIconDev(
                icon: Icons.menu,
                width: 50,
                heigth: 30,
                color: Colors.white,
                onPressed: _toggleMenu,
                borderCircular: const BorderRadius.horizontal(right: Radius.circular(12)),
              ),
            ),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "BIENVENIDO    A    A.S.A",
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
            const SizedBox(height: 50),
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
                  const Icon(CupertinoIcons.moon_fill, color: Colors.white),
              title: const Text(
                "Modo Oscuto",
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
              leading: const Icon(Icons.refresh, color: Colors.white),
              title: const Text(
                "Forzar actualización de datos",
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
}
