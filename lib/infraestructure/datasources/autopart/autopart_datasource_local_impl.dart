import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_brand_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_category_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_list_model.dart';
import 'package:san_andres_mobile/infraestructure/model/autoparts/autopart_type_info_model.dart';
import 'package:san_andres_mobile/presentation/services/api_client_secure.dart';

class AutopartDatasourceLocalImpl extends AutopartDatasource {
  final AppDatabase _database;
  final Dio _client = apiAuto;
  AutopartDatasourceLocalImpl(this._database);

  @override
  Future<List<AutopartList>> searchAutoparts(
      Map<String, dynamic> queryParams) async {
    final response = await _client.get(
      'search-autopart',
      queryParameters: queryParams,
    );

    final List<dynamic> data = response.data;
    return data.map((json) => AutopartListModel.fromJson(json)).toList();
  }

  @override
  Future<List<AutopartCategory>> getCategories() async {
    final categories = await _database.select(_database.categoryTable).get();

    return categories
        .map((row) => AutopartCategoryModel.fromTableData(row))
        .toList();
  }

  @override
  Future<List<AutopartBrand>> getBrands() async {
    final brands = await _database.select(_database.autopartBrandTable).get();

    return brands
        .map((brandRow) => AutopartBrandModel.fromTableData(brandRow))
        .toList();
  }

  @override
  Future<List<AutopartTypeInfo>> getTypeInfos() async {
    final rows = await _database.select(_database.autopartTypeInfoTable).get();

    return rows.map((row) => AutopartTypeInfoModel.fromTableData(row)).toList();
  }

  @override
  Future<List<AutopartList>> getAutopartsList() async {
    final query = _database.select(_database.autopartTable).join([
      innerJoin(
        _database.autopartBrandTable,
        _database.autopartBrandTable.id
            .equalsExp(_database.autopartTable.brandId),
      ),
      innerJoin(
        _database.categoryTable,
        _database.categoryTable.id
            .equalsExp(_database.autopartTable.categoryId),
      ),
    ]);

    final results = await query.get();
    return Future.wait(results.map((row) async {
      final autopart = row.readTable(_database.autopartTable);
      final brand = row.readTable(_database.autopartBrandTable);
      final category = row.readTable(_database.categoryTable);

      final query = _database.select(_database.autopartInfoTable).join([
        innerJoin(
          _database.autopartTypeInfoTable,
          _database.autopartTypeInfoTable.id
              .equalsExp(_database.autopartInfoTable.typeId),
        ),
      ])
        ..where(_database.autopartInfoTable.autopartId.equals(autopart.id));

      final infosRows = await query.get();

      final infos = infosRows.map((row) {
        final info = row.readTable(_database.autopartInfoTable);
        final type = row.readTable(_database.autopartTypeInfoTable);

        return AutopartInfoList(
          id: info.refId ?? 0,
          value: info.value,
          typeId: info.typeId,
          typeName: type.name,
          type: type.type,
          autopartId: info.autopartId,
        );
      }).toList();

      final assetsRows = await (_database.select(_database.autopartAssetTable)
            ..where((t) => t.autopartId.equals(autopart.id)))
          .get();

      final assets = assetsRows
          .map((assetRow) => AutopartAssetList(
                id: assetRow.refId ?? 0,
                asset: assetRow.asset,
                description: assetRow.description ?? '',
                autopartId: assetRow.autopartId,
              ))
          .toList();

      return AutopartList(
        id: autopart.refId ?? 0,
        name: autopart.name ?? '',
        categoryId: autopart.categoryId,
        categoryName: category.name,
        brandId: autopart.brandId,
        brandName: brand.name,
        infos: infos,
        assets: assets,
      );
    }));
  }

  // CREATES
  @override
  Future<int> createBrand(AutopartBrand brand) async {
    final brandCompanion = AutopartBrandTableCompanion.insert(
      refId: Value(brand.id),
      name: brand.name,
      logo: Value(brand.logo),
    );

    return await _database
        .into(_database.autopartBrandTable)
        .insert(brandCompanion);
  }

  @override
  Future<int> createAutopart(Autopart autopart) async {
    final companion = AutopartTableCompanion.insert(
      refId: Value(autopart.id),
      name: Value(autopart.name),
      categoryId: autopart.categoryId,
      brandId: autopart.categoryId,
    );

    return await _database.into(_database.autopartTable).insert(companion);
  }

  @override
  Future<int> createCategory(AutopartCategory category) async {
    final companion = CategoryTableCompanion.insert(
      refId: category.id,
      name: category.name,
      description: Value(category.description),
    );

    return await _database.into(_database.categoryTable).insert(companion);
  }

  @override
  Future<int> createTypeInfo(AutopartTypeInfo typeInfo) async {
    final companion = AutopartTypeInfoTableCompanion.insert(
        refId: Value(typeInfo.id),
        name: typeInfo.name,
        description: Value(typeInfo.description),
        type: typeInfo.type);

    return await _database
        .into(_database.autopartTypeInfoTable)
        .insert(companion);
  }

  @override
  Future<int> createAutopartAsset(AutopartAsset asset) async {
    final companion = AutopartAssetTableCompanion.insert(
        refId: Value(asset.id),
        asset: asset.asset,
        description: Value(asset.description),
        autopartId: asset.autopartId);

    return await _database.into(_database.autopartAssetTable).insert(companion);
  }

  @override
  Future<int> createAutopartInfo(AutopartInfo info) async {
    final companion = AutopartInfoTableCompanion.insert(
        refId: Value(info.id),
        typeId: info.typeId,
        value: info.value,
        autopartId: info.autopartId);

    return await _database.into(_database.autopartInfoTable).insert(companion);
  }

  // UPDATES
  @override
  Future<void> updateAutopart(Autopart autopart) async {
    final companion = AutopartTableCompanion(
      refId: Value(autopart.id),
      name: Value(autopart.name),
      categoryId: Value(autopart.categoryId),
      brandId: Value(autopart.brandId),
    );

    await _database.update(_database.autopartTable).replace(companion);
  }

  @override
  Future<void> updateCategory(AutopartCategory category) async {
    final companion = CategoryTableCompanion(
      refId: Value(category.id),
      name: Value(category.name),
      description: Value(category.description),
    );

    await _database.update(_database.categoryTable).replace(companion);
  }

  @override
  Future<void> updateTypeInfo(AutopartTypeInfo typeInfo) async {
    final companion = AutopartTypeInfoTableCompanion(
      refId: Value(typeInfo.id),
      name: Value(typeInfo.name),
      description: Value(typeInfo.description),
      type: Value(typeInfo.type),
    );

    await _database.update(_database.autopartTypeInfoTable).replace(companion);
  }

  @override
  Future<void> updateBrand(AutopartBrand brand) async {
    final brandCompanion = AutopartBrandTableCompanion(
      refId: Value(brand.id),
      name: Value(brand.name),
      logo: Value(brand.logo),
    );

    await _database
        .update(_database.autopartBrandTable)
        .replace(brandCompanion);
  }

  @override
  Future<void> updateAutopartAsset(AutopartAsset asset) async {
    final brandCompanion = AutopartAssetTableCompanion(
      refId: Value(asset.id),
      autopartId: Value(asset.autopartId),
      asset: Value(asset.asset),
      description: Value(asset.description),
    );

    await _database
        .update(_database.autopartAssetTable)
        .replace(brandCompanion);
  }

  @override
  Future<void> updateAutopartInfo(AutopartInfo info) async {
    final brandCompanion = AutopartInfoTableCompanion(
      refId: Value(info.id),
      typeId: Value(info.typeId),
      autopartId: Value(info.autopartId),
      value: Value(info.value),
    );

    await _database.update(_database.autopartInfoTable).replace(brandCompanion);
  }

  // DELETES
  @override
  Future<void> deleteBrand(int id) async {
    await _database
        .delete(_database.autopartBrandTable)
        .delete(AutopartBrandTableCompanion(refId: Value(id)));
  }

  @override
  Future<void> deleteAutopart(int id) async {
    await _database
        .delete(_database.autopartTable)
        .delete(AutopartTableCompanion(refId: Value(id)));
  }

  @override
  Future<void> deleteCategory(int id) async {
    await _database
        .delete(_database.categoryTable)
        .delete(CategoryTableCompanion(refId: Value(id)));
  }

  @override
  Future<void> deleteTypeInfo(int id) async {
    await _database
        .delete(_database.autopartTypeInfoTable)
        .delete(AutopartTypeInfoTableCompanion(refId: Value(id)));
  }

  @override
  Future<void> deleteAutopartAsset(int id) async {
    await _database
        .delete(_database.autopartAssetTable)
        .delete(AutopartAssetTableCompanion(refId: Value(id)));
  }

  @override
  Future<void> deleteAutopartInfo(int id) async {
    await _database
        .delete(_database.autopartInfoTable)
        .delete(AutopartInfoTableCompanion(refId: Value(id)));
  }
}
