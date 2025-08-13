import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';

abstract class AutopartDatasource {
  // READ
  Future<List<AutopartList>> searchAutoparts(Map<String, dynamic> queryParams);
  Future<List<AutopartBrand>> getBrands();
  Future<List<AutopartCategory>> getCategories();
  Future<List<AutopartTypeInfo>> getTypeInfos();
  Future<List<AutopartList>> getAutoparts();

  // CREATE
  Future<int> createBrand(AutopartBrand brand);
  Future<int> createCategory(AutopartCategory category);
  Future<int> createTypeInfo(AutopartTypeInfo typeInfo);
  Future<int> createAutopart(AutopartList autopart);

  // UPDATE
  Future<void> updateBrand(AutopartBrand brand);
  Future<void> updateCategory(AutopartCategory category);
  Future<void> updateTypeInfo(AutopartTypeInfo typeInfo);
  Future<void> updateAutopart(AutopartList autopart);

  // DELETE
  Future<void> deleteBrand(int id);
  Future<void> deleteCategory(int id);
  Future<void> deleteTypeInfo(int id);
  Future<void> deleteAutopart(int id);
}
