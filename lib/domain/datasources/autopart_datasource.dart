import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/infraestructure/model/autopart_model.dart';

abstract class AutopartDatasource {
  Future<List<AutopartList>> getAutopartsGlobalSql();
  Future<List<AutopartAssetModel>> getAutopartAssets(int autopartId);
  Future<AutopartOfSeller> createAutopart(AutopartOfSeller create);
  Future<List<AutopartSearchList>> searchAutoparts(Map<String, dynamic> queryParams);
}