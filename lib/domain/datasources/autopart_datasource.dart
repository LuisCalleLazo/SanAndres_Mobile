import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';

abstract class AutopartDatasource {
  Future<List<AutopartList>> searchAutoparts(Map<String, dynamic> queryParams);
  Future<List<AutopartBrand>> getBrands();
  Future<List<AutopartCategory>> getCategories();
  Future<List<AutopartTypeInfo>> getTypeInfos();
  Future<List<AutopartList>> getAutoparts();

  Future<int> createLocalBrand(AutopartBrand brand);
  Future<List<AutopartBrand>> getLocalBrands();
  Future<void> updateLocalBrand(AutopartBrand brand);
  Future<void> deleteLocalBrand(int id);
}