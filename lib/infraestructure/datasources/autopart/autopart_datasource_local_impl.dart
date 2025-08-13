import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_brand_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_category_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_list_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_type_info_model.dart';
import 'package:san_andres_mobile/presentation/services/api_client_secure.dart';

class AutopartDatasourceLocalImpl extends AutopartDatasource 
{
  final AppDatabase _database;
  final Dio _client = apiAuto;
  AutopartDatasourceLocalImpl(this._database);

  @override
  Future<List<AutopartList>> searchAutoparts(
      Map<String, dynamic> queryParams) async {
    final response = await _client.get(
      'search-autopart',
      queryParameters: queryParams,
    );

    final List<dynamic> data = response.data;
    return data.map((json) => AutopartListModel.fromJson(json)).toList();
  }

  @override
  Future<List<AutopartCategory>> getCategories() async {
    final categories = await _database.select(_database.categoryTable).get();

    return categories
        .map((row) => AutopartCategoryModel.fromTableData(row))
        .toList();
  }

  @override
  Future<List<AutopartBrand>> getBrands() async {
    final brands = await _database.select(_database.autopartBrandTable).get();

    return brands
        .map((brandRow) => AutopartBrandModel.fromTableData(brandRow))
        .toList();
  }

  @override
  Future<List<AutopartTypeInfo>> getTypeInfos() async {
    final response = await _client.get('autopart/type-info');
    final List<dynamic> data = response.data;
    return data.map((json) => AutopartTypeInfoModel.fromJson(json)).toList();
  }

  @override
  Future<List<AutopartList>> getAutoparts() async {
    final response = await _client.get('autopart');
    final List<dynamic> data = response.data;
    return data.map((json) => AutopartListModel.fromJson(json)).toList();
  }

  @override
  Future<int> createBrand(AutopartBrand brand) async {
    final brandCompanion = AutopartBrandTableCompanion.insert(
      refId: Value(brand.id),
      name: brand.name,
      logo: Value(brand.logo),
    );

    return await _database
        .into(_database.autopartBrandTable)
        .insert(brandCompanion);
  }

  @override
  Future<void> updateBrand(AutopartBrand brand) async {
    final brandCompanion = AutopartBrandTableCompanion(
      refId: Value(brand.id),
      name: Value(brand.name),
      logo: Value(brand.logo),
    );

    await _database
        .update(_database.autopartBrandTable)
        .replace(brandCompanion);
  }

  @override
  Future<void> deleteBrand(int id) async {
    await _database
        .delete(_database.autopartBrandTable)
        .delete(AutopartBrandTableCompanion(id: Value(id)));
  }
  
  @override
  Future<int> createAutopart(AutopartList autopart) {
    // TODO: implement createAutopart
    throw UnimplementedError();
  }
  
  @override
  Future<int> createCategory(AutopartCategory category) {
    // TODO: implement createCategory
    throw UnimplementedError();
  }
  
  @override
  Future<int> createTypeInfo(AutopartTypeInfo typeInfo) {
    // TODO: implement createTypeInfo
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteAutopart(int id) {
    // TODO: implement deleteAutopart
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteCategory(int id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTypeInfo(int id) {
    // TODO: implement deleteTypeInfo
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateAutopart(AutopartList autopart) {
    // TODO: implement updateAutopart
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateCategory(AutopartCategory category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateTypeInfo(AutopartTypeInfo typeInfo) {
    // TODO: implement updateTypeInfo
    throw UnimplementedError();
  }
}
