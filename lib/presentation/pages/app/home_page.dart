import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/screens/home/autoparts_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/catalogs_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/clients_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/reports_screen.dart';
import 'package:san_andres_mobile/presentation/screens/home/sales_screen.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Deynar Luis Calle Lazo"),
        // actions: [
        //   BtnTextDefault(
        //     text: "text",
        //     onPressed: () {},
        //   ),
        // ],
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
    );
  }
}
