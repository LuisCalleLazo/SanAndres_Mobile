import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/syncable_item.dart';
import 'package:san_andres_mobile/domain/repositories/autopart_repository.dart';
import 'package:san_andres_mobile/presentation/services/api_error_handle.dart';

class AutopartRepositoryImpl extends AutopartRepository {
  final AutopartDatasource remoteDataSource;
  final AutopartDatasource localDataSource;

  AutopartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  // @override
  // Future<List<AutopartOfSeller>> getAutoparts() async {
  //   try {
  //     final response = await dataSource.getAutoparts();
  //     return response;
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   }
  // }

  @override
  Future<List<AutopartList>> searchAutoparts(
      Map<String, dynamic> queryParams) async {
    try {
      final response = await remoteDataSource.searchAutoparts(queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> syncAutopartBrands(BuildContext context) async {
    await syncItems<AutopartBrand>(
      context: context,
      getRemoteItems: () => remoteDataSource.getBrands(),
      getLocalItems: () => localDataSource.getBrands(),
      createLocalItem: (item) => localDataSource.createBrand(item),
      updateLocalItem: (item) => localDataSource.updateBrand(item),
      deleteLocalItem: (id) => localDataSource.deleteBrand(id),
    );
  }

  @override
  Future<void> syncAutopartCategories(BuildContext context) async {
    await syncItems<AutopartCategory>(
      context: context,
      getRemoteItems: () => remoteDataSource.getCategories(),
      getLocalItems: () => localDataSource.getCategories(),
      createLocalItem: (item) => localDataSource.createCategory(item),
      updateLocalItem: (item) => localDataSource.updateCategory(item),
      deleteLocalItem: (id) => localDataSource.deleteCategory(id),
    );
  }

  @override
  Future<void> syncAutopartTypeInfo(BuildContext context) async {
    await syncItems<AutopartTypeInfo>(
      context: context,
      getRemoteItems: () => remoteDataSource.getTypeInfos(),
      getLocalItems: () => localDataSource.getTypeInfos(),
      createLocalItem: (item) => localDataSource.createTypeInfo(item),
      updateLocalItem: (item) => localDataSource.updateTypeInfo(item),
      deleteLocalItem: (id) => localDataSource.deleteTypeInfo(id),
    );
  }

  Future<void> syncItems<T extends SyncableItem>({
    required BuildContext context,
    required Future<List<T>> Function() getRemoteItems,
    required Future<List<T>> Function() getLocalItems,
    required Future<void> Function(T) createLocalItem,
    required Future<void> Function(T) updateLocalItem,
    required Future<void> Function(int) deleteLocalItem,
  }) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final List<T> serverItems = await getRemoteItems();
      final List<T> localItems = await getLocalItems();

      final serverItemsMap = {for (var b in serverItems) b.id: b};
      final localItemsMap = {for (var b in localItems) b.id: b};

      final itemsToCreate = <T>[];
      final itemsToUpdate = <T>[];
      final itemIdsToDelete = <int>[];

      // Identificar items a crear
      for (var serverItem in serverItems) {
        if (!localItemsMap.containsKey(serverItem.id)) {
          itemsToCreate.add(serverItem);
        }
      }

      // Identificar items a actualizar o eliminar
      for (var localItem in localItems) {
        final serverItem = serverItemsMap[localItem.id];
        if (serverItem != null) {
          if (localItem.hasChanges(serverItem)) {
            itemsToUpdate.add(serverItem);
          }
        } else {
          itemIdsToDelete.add(localItem.id);
        }
      }

      // Ejecutar operaciones
      await Future.wait(itemsToCreate.map(createLocalItem));
      await Future.wait(itemsToUpdate.map(updateLocalItem));
      await Future.wait(itemIdsToDelete.map(deleteLocalItem));
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }

  Autopart autopartFromList(AutopartList listItem) {
    return Autopart(
      id: listItem.id,
      name: listItem.name,
      brandId: listItem.brandId,
      categoryId: listItem.categoryId,
    );
  }

  AutopartAsset autopartAssetFromList(AutopartAssetList listItem) {
    return AutopartAsset(
      id: listItem.id,
      asset: listItem.asset,
      description: listItem.description,
      autopartId: listItem.autopartId,
    );
  }

  AutopartInfo autopartInfoFromList(AutopartInfoList listItem) {
    return AutopartInfo(
      id: listItem.id,
      typeId: listItem.typeId,
      autopartId: listItem.autopartId,
      value: listItem.value,
    );
  }
}
