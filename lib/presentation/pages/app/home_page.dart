import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_text_default.dart';
import 'package:san_andres_mobile/presentation/widgets/navigation/navigation.dart';

class HomePage extends StatefulWidget {
  static String name = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    // const HomeScreen(),
    // const SearchScreen(),
    // const HistoryScreen(),
    // const NotificationScreen(),
    // const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navigation(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
