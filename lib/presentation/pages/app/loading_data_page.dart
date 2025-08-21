import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_provider.dart';
import 'package:san_andres_mobile/presentation/widgets/card/endpoint_loading_card.dart';

class LoadingDataPage extends StatefulWidget {
  static String name = "loading_data_page";

  const LoadingDataPage({super.key});

  @override
  State<LoadingDataPage> createState() => _LoadingDataPageState();
}

class _LoadingDataPageState extends State<LoadingDataPage> {
  bool _allCompleted = false;

  late final List<Map<String, dynamic>> _endpoints;
  late final List<LoadingState> _states;
  late final List<String?> _errors;

  @override
  void initState() {
    super.initState();
    final autopartProvider =
        Provider.of<AutopartProvider>(context, listen: false);

    _endpoints = [
      {
        'name': 'Marcas',
        'method': () => autopartProvider.repo.syncAutopartBrands(context),
      },
      {
        'name': 'Categorías',
        'method': () => autopartProvider.repo.syncAutopartCategories(context),
      },
      {
        'name': 'Tipos de información',
        'method': () => autopartProvider.repo.syncAutopartTypeInfo(context),
      },
      {
        'name': 'Autopartes',
        'method': () => autopartProvider.repo.syncAutoparts(context),
      },
    ];

    _states = List.filled(_endpoints.length, LoadingState.pending);
    _errors = List.filled(_endpoints.length, null);

    _startNext(0); // 👈 arrancamos la primera
  }

  void _startNext(int index) async {
    if (index >= _endpoints.length) {
      _checkAllCompleted();
      return;
    }

    setState(() => _states[index] = LoadingState.loading);

    final endpoint = _endpoints[index];
    try {
      await endpoint['method']();
      setState(() => _states[index] = LoadingState.completed);
      _startNext(index + 1); // 👈 lanza la siguiente
    } catch (e) {
      setState(() {
        _states[index] = LoadingState.failed;
        _errors[index] = e.toString();
      });
    }
  }

  void _checkAllCompleted() {
    if (!_allCompleted &&
        _states.every((state) => state == LoadingState.completed)) {
      setState(() => _allCompleted = true);

      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) context.go('/home');
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
                  state: _states[index],
                  errorMessage: _errors[index],
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
