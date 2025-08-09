import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/auth_provider.dart';
import 'package:san_andres_mobile/presentation/screens/home/autoparts_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/history_sale_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/menu_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/quotes_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/reports_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/sales_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/search_autoparts_screen.dart';
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
  late AuthProvider authProvider;
  int _selectedIndex = 0;
  late List<Widget> _screens;
  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);

    final isSeller = authProvider.seller ?? false;

    _screens = [
      if (isSeller) ...[
        const AutopartsScreen(),
        const SalesScreen(),
        const ReportsScreen(),
        const QuotesScreen(),
      ] else ...[
        const SearchAutopartsScreen(),
        const HistorySaleScreen(),
      ],
    ];
  }

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

  DateTime? currentBackPressTime;
  void _handlePopInvoked(bool didPop, Object? result) {
    if (didPop) return;

    final now = DateTime.now();
    final shouldExit = currentBackPressTime != null &&
        now.difference(currentBackPressTime!) <= const Duration(seconds: 2);

    if (shouldExit) {
      SystemNavigator.pop();
    } else {
      currentBackPressTime = now;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Presiona de nuevo para salir')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _handlePopInvoked,
      child: Stack(
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
                  borderCircular:
                      const BorderRadius.horizontal(right: Radius.circular(12)),
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
                      fontSize: 20,
                      color: Colors.red[900],
                    ),
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
                // ignore: deprecated_member_use
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
              child: MenuScreen(toggleMenu: _toggleMenu),
            ),
        ],
      ),
    );
  }
}
