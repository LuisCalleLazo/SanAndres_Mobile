import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';

abstract class AutopartDatasource {
  Future<List<Autopart>> getAutopartsGlobalSql();
}