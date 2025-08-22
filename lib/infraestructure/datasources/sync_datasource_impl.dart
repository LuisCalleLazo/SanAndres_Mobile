import 'package:dio/dio.dart';
import 'package:san_andres_mobile/domain/datasources/sync_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/domain/entities/customer/customer.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_seller.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';
import '../../presentation/services/api_client.dart';

class SyncDatasourceImpl extends SyncDatasource {
  final AppDatabase _database;

  SyncDatasourceImpl(this._database);
  final Dio _client = api;

  @override
  Future<List<AutopartOfSeller>> syncAutopartOfSeller() {
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> syncCustomers() {
    throw UnimplementedError();
  }

  @override
  Future<List<SaleSeller>> syncSalesSeller() {
    throw UnimplementedError();
  }
}
