import 'package:dio/dio.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_brand_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_category_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_list_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_type_info_model.dart';
import 'package:san_andres_mobile/presentation/services/api_client_secure.dart';

class AutopartDatasourceImpl extends AutopartDatasource {
  final Dio _client = apiAuto;
  AutopartDatasourceImpl();

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
  Future<int> createBrand(AutopartBrand brand) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteBrand(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateBrand(AutopartBrand brand) {
    throw UnimplementedError();
  }
  
  @override
  Future<int> createAutopart(Autopart autopart) {
    throw UnimplementedError();
  }
  
  @override
  Future<int> createCategory(AutopartCategory category) {
    throw UnimplementedError();
  }
  
  @override
  Future<int> createTypeInfo(AutopartTypeInfo typeInfo) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteAutopart(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteCategory(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTypeInfo(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateAutopart(Autopart autopart) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateCategory(AutopartCategory category) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateTypeInfo(AutopartTypeInfo typeInfo) {
    throw UnimplementedError();
  }
  
  @override
  Future<int> createAutopartAsset(AutopartAsset asset) {
    throw UnimplementedError();
  }
  
  @override
  Future<int> createAutopartInfo(AutopartInfo info) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteAutopartAsset(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteAutopartInfo(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateAutopartAsset(AutopartAsset asset) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateAutopartInfo(AutopartInfo info) {
    throw UnimplementedError();
  }

}
