import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';

class AutopartList {

  final int id;
  final String name;
  final int categoryId;
  final String categoryName;
  final int brandId;
  final String brandName;
  final List<AutopartInfoList> infos;
  final List<AutopartAssetList> assets;

  AutopartList({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.categoryName,
    required this.brandId,
    required this.brandName,
    required this.infos,
    required this.assets
  });
}

class AutopartAssetList {
  final int id;
  final String asset;
  final String description;
  final int autopartId;

  AutopartAssetList({
    required this.id,
    required this.asset,
    required this.description,
    required this.autopartId,
  });
}

class AutopartInfoList {

  final int id;
  final String value;
  final int typeId;
  final String? typeName;
  final int autopartId;
  final AutopartTypeInfoEnum type;

  AutopartInfoList({
    required this.id,
    required this.value,
    required this.typeId,
    this.typeName,
    required this.type,
    required this.autopartId,
  });
}