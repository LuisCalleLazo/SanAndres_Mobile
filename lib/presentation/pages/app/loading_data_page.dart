import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/services/api_client.dart';
import 'package:san_andres_mobile/presentation/widgets/card/endpoint_loading_card.dart';

class LoadingDataPage extends StatefulWidget {
  static String name = "loading_data_page";

  const LoadingDataPage({super.key});

  @override
  State<LoadingDataPage> createState() => _LoadingDataPageState();
}

class _LoadingDataPageState extends State<LoadingDataPage> {
  final Dio _client = api;
  bool _allCompleted = false;
  final List<bool> _completedStatus =
      []; // Lista para rastrear el estado de cada endpoint

  final List<Map<String, dynamic>> _endpoints = [
    {
      'name': 'Marcas',
      'method': (Dio client) => client.get('autopart/brand'),
    },
    {
      'name': 'Categorias',
      'method': (Dio client) => client.get('autopart/category'),
    },
    {
      'name': 'Tipos de informacion',
      'method': (Dio client) => client.get('autopart/type-info'),
    },
    {
      'name': 'Autopartes',
      'method': (Dio client) => client.get('autopart'),
    },
  ];

  @override
  void initState() {
    super.initState();
    // Inicializar la lista de estados
    _completedStatus.addAll(List.filled(_endpoints.length, false));
  }

  void _checkAllCompleted() {
    if (!_allCompleted && _completedStatus.every((status) => status)) {
      setState(() {
        _allCompleted = true;
      });
      
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          context.go('/home');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Image.asset(
                    'assets/icons/logo_recort.png',
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ),
              ),
              const Text(
                'Cargando datos iniciales',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ..._endpoints.asMap().entries.map((entry) {
                final index = entry.key;
                final endpoint = entry.value;
                return EndpointLoadingCard(
                  endpoint: endpoint['name'],
                  loadFunction: () => endpoint['method'](_client),
                  isLastItem: index == _endpoints.length - 1,
                  primaryColor: const Color(0xFF800020),
                  onCompleted: (success) {
                    setState(() {
                      _completedStatus[index] = true;
                    });
                    _checkAllCompleted();
                  },
                );
              }),
              const SizedBox(height: 24),
              if (_allCompleted)
                const Text(
                  '¡Todo listo! Redirigiendo...',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
