import 'package:flutter/material.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_icon_dev.dart';

class ImgsAutopartsPage extends StatefulWidget {
  static String name = "imgs_autoparts_page";
  const ImgsAutopartsPage({super.key});

  @override
  State<ImgsAutopartsPage> createState() => _ImgsAutopartsPageState();
}

class _ImgsAutopartsPageState extends State<ImgsAutopartsPage> {
  final PageController _pageController = PageController();
  final List<String> _imageUrls = [
    'https://picsum.photos/id/1/600/250',
    'https://picsum.photos/id/2/600/250',
    'https://picsum.photos/id/3/600/250',
    'https://picsum.photos/id/4/600/250',
  ];

  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < _imageUrls.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Imagenes de autoparte"),
      ),
      body: Stack(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Image.network(
                    _imageUrls[index],
                    fit: BoxFit
                        .contain, // Respeta el tamaño original de la imagen
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "${_currentPage + 1} / ${_imageUrls.length}",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnIconDev(
                  width: 20,
                  onPressed: _currentPage > 0 ? _previousPage : null,
                  icon: Icons.arrow_back_ios,
                  color: Colors.transparent,
                  colorIcon: Colors.red,
                ),
                BtnIconDev(
                  width: 20,
                  onPressed:
                      _currentPage < _imageUrls.length - 1 ? _nextPage : null,
                  icon: Icons.arrow_forward_ios,
                  color: Colors.transparent,
                  colorIcon: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
