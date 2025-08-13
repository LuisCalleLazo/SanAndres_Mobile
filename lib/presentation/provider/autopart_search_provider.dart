import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/repositories/autopart_repository.dart';

class AutopartSearchProvider extends ChangeNotifier {
  final AutopartRepository repo;
  AutopartSearchProvider(this.repo);

  List<AutopartList> _autoparts = [];
  List<AutopartList> get autoparts => _autoparts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> searchAutoparts({
    String? productName,
    int? categoryId,
    int? brandId,
    String? minPrice,
    String? maxPrice,
  }) async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      final Map<String, dynamic> queryParams = {};

      if (productName != null && productName.isNotEmpty) {
        queryParams['ProductName'] = productName;
      }
      if (categoryId != null) {
        queryParams['CategoryId'] = categoryId;
      }
      if (brandId != null) {
        queryParams['BrandId'] = brandId;
      }
      if (minPrice != null && minPrice.isNotEmpty) {
        queryParams['MinPrice'] = minPrice;
      }
      if (maxPrice != null && maxPrice.isNotEmpty) {
        queryParams['MaxPrice'] = maxPrice;
      }

      _autoparts = await repo.searchAutoparts(queryParams);
    } catch (e) {
      _hasError = true;
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
