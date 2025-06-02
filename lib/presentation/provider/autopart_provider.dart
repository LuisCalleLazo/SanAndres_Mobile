import 'package:flutter/foundation.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/infraestructure/datasources/autopart_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/repositories/autopart_repository_impl.dart';

class AutopartProvider extends ChangeNotifier{
  final AutopartRepositoryImpl repo =
  AutopartRepositoryImpl(AutopartDatasourceImpl());

  // Lista privada para guardar los autoparts
  List<Autopart> _autoparts = [];

  // Getter público para acceder a la lista
  List<Autopart> get autoparts => _autoparts;

  // Método para cargar los autoparts desde el repositorio
  Future<void> loadAutopartsGlobal() async {
    _autoparts = await repo.getAutopartsGlobal(); // o el método que tengas en repo
    notifyListeners();  // Notifica a la UI que los datos cambiaron
  }
}