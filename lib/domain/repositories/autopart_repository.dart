import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';

abstract class AutopartRepository {
  // Future<List<AutopartOfSeller>> getAutoparts();
  Future<List<AutopartList>> searchAutoparts(Map<String, dynamic> queryParams);
  Future<void> syncAutopartBrands(BuildContext context);
  Future<void> syncAutopartCategories(BuildContext context);
  Future<void> syncAutopartTypeInfo(BuildContext context);
  Future<void> syncAutoparts(BuildContext context);
  Future<void> syncAutopartsOfSeller(BuildContext context);
  Future<void> syncSales(BuildContext context);
  Future<void> syncBuys(BuildContext context);
  Future<void> syncGeneral(BuildContext context);
}
