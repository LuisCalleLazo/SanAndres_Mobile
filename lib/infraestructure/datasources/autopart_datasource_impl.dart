import 'package:san_andres_mobile/config/db/autoparts/autoparts_init_db.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';

class AutopartDatasourceImpl extends AutopartDatasource
{
  @override
  Future<List<Autopart>> getAutopartsGlobalSql() async {
    final db = await AutopartsInitDb.instance.database;

    final List<Map<String, dynamic>> maps = await db.query('Autopart');

    return maps.map((map) => Autopart.fromMap(map)).toList();
  }
}