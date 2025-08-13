import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_brand_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_category_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_list_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_type_info_model.dart';
import 'package:san_andres_mobile/presentation/services/api_client_secure.dart';

class AutopartDatasourceImpl extends AutopartDatasource {
  final Dio _client = apiAuto;
  final AppDatabase _database;
  AutopartDatasourceImpl(this._database);

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
    final response = await _client.get('autopart/category');
    final List<dynamic> data = response.data;
    return data.map((json) => AutopartCategoryModel.fromJson(json)).toList();
  }

  @override
  Future<List<AutopartBrand>> getBrands() async {
    final response = await _client.get('autopart/brand');
    final List<dynamic> data = response.data;
    return data.map((json) => AutopartBrandModel.fromJson(json)).toList();
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
  Future<int> createLocalBrand(AutopartBrand brand) async {
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
  Future<List<AutopartBrand>> getLocalBrands() async {
    final brands = await _database.select(_database.autopartBrandTable).get();

    return brands
        .map((brandRow) => AutopartBrandModel.fromTableData(brandRow))
        .toList();
  }

  @override
  Future<void> updateLocalBrand(AutopartBrand brand) async {
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
  Future<void> deleteLocalBrand(int id) async {
    await _database
        .delete(_database.autopartBrandTable)
        .delete(AutopartBrandTableCompanion(id: Value(id)));
  }
}
