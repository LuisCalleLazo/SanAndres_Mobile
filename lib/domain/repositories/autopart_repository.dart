import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';

abstract class AutopartRepository {
  // Future<List<AutopartOfSeller>> getAutoparts();
  Future<List<AutopartList>> searchAutoparts(Map<String, dynamic> queryParams);
}
