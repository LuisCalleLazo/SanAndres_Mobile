import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/category.dart';
import 'package:san_andres_mobile/infraestructure/model/autopart_model.dart';

abstract class AutopartDatasource {
  Future<List<AutopartList>> getAutopartsGlobalSql();
  Future<List<AutopartAssetModel>> getAutopartAssets(int autopartId);
  Future<AutopartOfSeller> createAutopart(AutopartOfSeller create);
  Future<List<AutopartSearchList>> searchAutoparts(Map<String, dynamic> queryParams);
  Future<List<AutopartBrand>> getBrands();
  Future<List<Category>> getCategories();
  Future<List<AutopartTypeInfo>> getTypeInfos();
  Future<List<dynamic>> getAutoparts();

}