import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_asset.dart';
import 'package:san_andres_mobile/infraestructure/datasources/autopart_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/repositories/autopart_repository_impl.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_provider.dart';
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_icon_dev.dart';

class ImgsAutopartsPage extends StatefulWidget {
  static String name = "imgs_autoparts_page";
  const ImgsAutopartsPage({super.key});

  @override
  State<ImgsAutopartsPage> createState() => _ImgsAutopartsPageState();
}

class _ImgsAutopartsPageState extends State<ImgsAutopartsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late Future<List<AutopartAsset>> _futureAssets;

  @override
  void initState() {
    super.initState();

    // Obtenemos el autopartId desde el provider
    final autopartProvider = Provider.of<AutopartProvider>(context, listen: false);
    final autopartId = autopartProvider.selectedAutopart?.id;

    if (autopartId == null) {
      // Manejo si no hay autopart seleccionado (opcional)
      _futureAssets = Future.value([]);
    } else {
      final repo = AutopartRepositoryImpl(AutopartDatasourceImpl());
      _futureAssets = repo.getAutopartAssets(autopartId);
    }
  }

  void _nextPage(int maxPage) {
    if (_currentPage < maxPage - 1) {
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
        title: const Text("Imágenes de autoparte"),
      ),
      body: FutureBuilder<List<AutopartAsset>>(
        future: _futureAssets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay imágenes disponibles'));
          }

          final assets = snapshot.data!;
          // Extraemos las URLs directamente de assets.asset
          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.network(
                      assets[index].asset,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "${_currentPage + 1} / ${assets.length}",
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
                      onPressed: _currentPage < assets.length - 1
                          ? () => _nextPage(assets.length)
                          : null,
                      icon: Icons.arrow_forward_ios,
                      color: Colors.transparent,
                      colorIcon: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
