
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/domain/entities/customer/customer.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_seller.dart';

abstract class SyncDatasource {
  Future<List<AutopartOfSeller>> syncAutopartOfSeller();
  Future<List<Customer>> syncCustomers();
  Future<List<SaleSeller>> syncSalesSeller();
}