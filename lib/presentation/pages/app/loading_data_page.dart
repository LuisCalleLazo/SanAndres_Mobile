import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/api_client.dart';

class LoadingDataPage extends StatefulWidget {
  static String name = "loading_data_page";

  const LoadingDataPage({super.key});

  @override
  State<LoadingDataPage> createState() => _LoadingDataPageState();
}

class _LoadingDataPageState extends State<LoadingDataPage> {
  double _progress = 0;
  String _status = "Iniciando descarga...";
  final Dio _client = api;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    // final database = Provider.of<AppDatabase>(context, listen: false);

    try {
      // Paso 1: Descargar autopartes
      setState(() {
        _status = "Descargando autopartes...";
        _progress = 0.2;
      });
      await _client.get('autopart/brand');
      // await database.batch((batch) {
      //   batch.insertAll(database.autopartTable, autoparts);
      // });

      // Paso 2: Descargar información adicional
      setState(() {
        _status = "Descargando información adicional...";
        _progress = 0.5;
      });
      await _client.get('autopart/category');
      await _client.get('autopart/type-info');
      await _client.get('autopart');
      // await database.batch((batch) {
      //   batch.insertAll(database.autopartBrandTable, brands);
      // });

      // Más operaciones...
      setState(() {
        _progress = 1.0;
        _status = "¡Listo!";
      });

      // Redirigir a Home después de 1 segundo
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        context.push('/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar datos: $e')),
        );
        context.push('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: _progress),
            const SizedBox(height: 20),
            Text(_status),
            if (_progress < 1) 
              Text('${(_progress * 100).toStringAsFixed(0)}% completado'),
          ],
        ),
      ),
    );
  }
}