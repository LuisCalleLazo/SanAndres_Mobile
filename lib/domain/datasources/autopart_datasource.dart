import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_asset.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';

abstract class AutopartDatasource {
  Future<List<AutopartList>> getAutopartsGlobalSql();
  Future<List<AutopartAsset>> getAutopartAssets(int autopartId);
  Future<AutopartOfSeller> createAutopart(AutopartOfSeller create);
  Future<List<AutopartOfSeller>> getAutoparts();
}