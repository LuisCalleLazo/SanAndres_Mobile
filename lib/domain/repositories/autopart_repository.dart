import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/infraestructure/model/autopart_model.dart';

abstract class AutopartRepository {
  Future<List<AutopartList>> getAutopartsGlobal();
  Future<List<AutopartAssetModel>> getAutopartAssets(int autopartId);
  Future<AutopartOfSeller> createAutopartSeller(AutopartOfSeller create);
  // Future<List<AutopartOfSeller>> getAutoparts();
  Future<List<AutopartSearchList>> searchAutoparts(
      Map<String, dynamic> queryParams);
}
