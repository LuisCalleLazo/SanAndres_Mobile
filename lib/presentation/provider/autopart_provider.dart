import 'package:flutter/foundation.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/repositories/autopart_repository.dart';

class AutopartProvider extends ChangeNotifier{
  final AutopartRepository repo;
  AutopartProvider(this.repo);

  final List<AutopartList> _autoparts = [];

  List<AutopartList> get autoparts => _autoparts;

  Future<void> loadAutopartsGlobal() async {
    // _autoparts = await repo.getAutopartsGlobal();
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
}