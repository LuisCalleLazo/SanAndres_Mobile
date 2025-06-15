import 'package:dio/dio.dart';
import 'package:san_andres_mobile/config/db/autoparts_init_db.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';
import 'package:san_andres_mobile/infraestructure/model/autopart_model.dart';
import 'package:san_andres_mobile/presentation/services/api_client_secure.dart';
import 'package:sqflite/sqflite.dart';

class AutopartDatasourceImpl extends AutopartDatasource {
  final Dio _client = apiAuto;

  @override
  Future<List<AutopartList>> getAutopartsGlobalSql() async {
    final db = await AutopartsInitDb.instance.database;

    final List<Map<String, dynamic>> rows = await db.rawQuery('''
      SELECT 
        a.id AS autopart_id,
        c.name AS category_name,
        ai.value AS info_value,
        ati.typeValue AS info_type
      FROM Autopart a
      LEFT JOIN Category c ON c.id = a.categoryId
      LEFT JOIN AutopartInfo ai ON ai.autopartId = a.id
      LEFT JOIN AutopartTypeInfo ati ON ati.id = ai.typeId
      WHERE ati.typeValue IN ('code', 'measures', 'contains')
      ORDER BY a.id;
    ''');

    // Agrupar por autopart_id y almacenar category_name
    final Map<int, List<AutopartInfoList>> groupedInfo = {};
    final Map<int, String> categoryByAutopart = {};

    for (final row in rows) {
      final autopartId = row['autopart_id'] as int;
      final categoryName = row['category_name'] as String? ?? '';
      final infoType = row['info_type'] as String?;
      final infoValue = row['info_value'] as String?;

      categoryByAutopart[autopartId] = categoryName;

      if (infoType != null && infoValue != null) {
        groupedInfo.putIfAbsent(autopartId, () => []);
        groupedInfo[autopartId]!
            .add(AutopartInfoList(type: infoType, value: infoValue));
      }
    }

    // Construir lista de Autopart
    final List<AutopartList> autoparts =
        categoryByAutopart.entries.map((entry) {
      final id = entry.key;
      final category = entry.value;
      final info = groupedInfo[id] ?? [];
      return AutopartList(id: id, category: category, info: info);
    }).toList();

    return autoparts;
  }

  @override
  Future<List<AutopartAssetModel>> getAutopartAssets(int autopartId) async {
    final db = await AutopartsInitDb.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'AutopartAsset',
      where: 'autopartId = ?',
      whereArgs: [autopartId],
    );
    return maps.map((map) => AutopartAssetModel.fromJson(map)).toList();
  }

  @override
  Future<AutopartOfSeller> createAutopart(AutopartOfSeller create) async {
    final db = await AutopartsInitDb.instance.database;

    final data = {
      'autopartId': create.autopartId,
      'amountUnit': create.amountUnit,
      'amountUnitPublic': create.amountUnitPublic,
      'unitPrice': create.unitPrice,
      'unitPricePublic': create.unitPricePublic,
    };

    final int id = await db.insert(
      'AutopartOfSeller',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return AutopartOfSeller(
      id: id,
      autopartId: create.autopartId,
      sellerId: create.sellerId,
      amountUnit: create.amountUnit,
      amountUnitPublic: create.amountUnitPublic,
      unitPrice: create.unitPrice,
      unitPricePublic: create.unitPricePublic,
    );
  }


  @override
  Future<List<AutopartSearchList>> searchAutoparts(
      Map<String, dynamic> queryParams) async {
    final response = await _client.get(
      'search-autopart',
      queryParameters: queryParams,
    );
   
    final List<dynamic> data = response.data;
    return data.map((json) => AutopartSearchListModel.fromJson(json)).toList();
  }
}
