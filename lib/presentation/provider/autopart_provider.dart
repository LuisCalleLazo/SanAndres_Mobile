import 'package:flutter/foundation.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/infraestructure/datasources/autopart_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/repositories/autopart_repository_impl.dart';

class AutopartProvider extends ChangeNotifier{
  final AutopartRepositoryImpl repo =
  AutopartRepositoryImpl(AutopartDatasourceImpl());

  List<AutopartList> _autoparts = [];

  List<AutopartList> get autoparts => _autoparts;

  Future<void> loadAutopartsGlobal() async {
    _autoparts = await repo.getAutopartsGlobal();
    notifyListeners();
  }

  AutopartList? _selectedAutopart;
  
  AutopartList? get selectedAutopart => _selectedAutopart;
  
  void selectAutopart(AutopartList? autopart) {
    _selectedAutopart = autopart;
    notifyListeners();
  }
  
  void clearSelection() {
    _selectedAutopart = null;
    notifyListeners();
  }

  
  Future<AutopartOfSeller> createAutopartSeller(AutopartOfSeller create) async {
    final createdAutopart = await repo.createAutopartSeller(create);
    notifyListeners();
    return createdAutopart;
  }
}