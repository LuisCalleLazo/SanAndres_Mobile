import 'package:dio/dio.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/domain/repositories/autopart_repository.dart';
import 'package:san_andres_mobile/infraestructure/datasources/autopart_datasource_impl.dart';
import 'package:san_andres_mobile/infraestructure/model/autopart_model.dart';
// import 'package:san_andres_mobile/presentation/services/api_error_handle.dart';

class AutopartRepositoryImpl extends AutopartRepository{
  
  final AutopartDatasourceImpl dataSource;

  AutopartRepositoryImpl(this.dataSource);

  
  @override
  Future<List<AutopartList>> getAutopartsGlobal() async {
    try {
      final response = await dataSource.getAutopartsGlobalSql();
      return response;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AutopartAssetModel>> getAutopartAssets(int autopartId) async {
    try {
      final response = await dataSource.getAutopartAssets(autopartId);
      return response;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<AutopartOfSeller> createAutopartSeller(AutopartOfSeller create) async {
    try {
      final response = await dataSource.createAutopart(create);
      return response;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AutopartOfSeller>> getAutoparts() async {
    try {
      final response = await dataSource.getAutoparts();
      return response;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}