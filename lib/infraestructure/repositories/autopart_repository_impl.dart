import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/datasources/autopart_datasource.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/repositories/autopart_repository.dart';
import 'package:san_andres_mobile/presentation/services/api_error_handle.dart';
// import 'package:san_andres_mobile/presentation/services/api_error_handle.dart';

class AutopartRepositoryImpl extends AutopartRepository {
  final AutopartDatasource remoteDataSource; // Fuente remota (API)
  final AutopartDatasource localDataSource;  // Fuente local (SQLite/Hive)

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

  Future<void> syncAutopartBrands(BuildContext context) async {
    final errorHandler = ApiErrorHandler(context);
    try {
      final List<AutopartBrand> serverBrands = await remoteDataSource.getBrands();
      final List<AutopartBrand> localBrands = await localDataSource.getBrands();

      final serverBrandsMap = {for (var b in serverBrands) b.id: b};
      final localBrandsMap = {for (var b in localBrands) b.id: b};

      final brandsToCreate = <AutopartBrand>[];
      final brandsToUpdate = <AutopartBrand>[];
      final brandIdsToDelete = <int>[];

      for (var serverBrand in serverBrands) {
        if (!localBrandsMap.containsKey(serverBrand.id)) {
          brandsToCreate.add(serverBrand);
        }
      }

      for (var localBrand in localBrands) {
        final serverBrand = serverBrandsMap[localBrand.id];
        if (serverBrand != null) {
          if (localBrand.name != serverBrand.name ||
              localBrand.logo != serverBrand.logo) {
            brandsToUpdate.add(serverBrand);
          }
        } else {
          brandIdsToDelete.add(localBrand.id);
        }
      }

      for (var brand in brandsToCreate) {
        await localDataSource.createBrand(brand);
      }

      for (var brand in brandsToUpdate) {
        await localDataSource.updateBrand(brand);
      }

      for (var id in brandIdsToDelete) {
        await localDataSource.deleteBrand(id);
      }
    } on DioException catch (e) {
      errorHandler.handleError(error: e);
      throw Exception(e);
    }
  }
}
