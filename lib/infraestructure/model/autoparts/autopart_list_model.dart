import 'package:san_andres_mobile/domain/entities/autoparts/autopart_list.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';

class AutopartListModel extends AutopartList {
  AutopartListModel(
      {required super.id,
      required super.name,
      required super.categoryId,
      required super.categoryName,
      required super.brandId,
      required super.brandName,
      required super.infos,
      required super.assets});

  factory AutopartListModel.fromJson(Map<String, dynamic> json) {
    return AutopartListModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      brandId: json['brandId'],
      brandName: json['brandName'],
      infos: (json['infos'] as List)
          .map((item) => AutopartInfoModel.fromJson(item))
          .toList(),
      assets: (json['assets'] as List)
          .map((item) => AutopartAssetModel.fromJson(item))
          .toList(),
    );
  }
  AutopartList toEntity() {
    return AutopartList(
      id: id,
      name: name,
      categoryId: categoryId,
      categoryName: categoryName,
      brandId: brandId,
      brandName: brandName,
      infos: infos,
      assets: assets,
    );
  }
}

class AutopartInfoModel extends AutopartInfoList {
  AutopartInfoModel({
    required super.id,
    required super.value,
    required super.typeId,
    required super.typeName,
    required super.type,
    required super.autopartId,
  });

  factory AutopartInfoModel.fromJson(Map<String, dynamic> map) {
    return AutopartInfoModel(
      id: map['id'],
      value: map['value'] ?? '',
      typeId: map['typeId'] ?? 0,
      typeName: map['typeName'] ?? '',
      type: AutopartTypeInfoEnum.values[map['type']],
      autopartId: map['autopartId'] ?? 0,
    );
  }

  AutopartInfoModel toEntity() {
    return AutopartInfoModel(
      id: id,
      value: value,
      typeId: typeId,
      typeName: typeName,
      type: type,
      autopartId: autopartId,
    );
  }
}

class AutopartAssetModel extends AutopartAssetList {
  AutopartAssetModel({
    required super.id,
    required super.asset,
    required super.description,
    required super.autopartId,
  });

  factory AutopartAssetModel.fromJson(Map<String, dynamic> map) {
    return AutopartAssetModel(
      id: map['id'],
      asset: map['asset'] ?? '',
      description: map['description'] ?? '',
      autopartId: map['autopartId'] ?? 0,
    );
  }

  AutopartAssetList toEntity() {
    return AutopartAssetList(
      id: id,
      asset: asset,
      description: description,
      autopartId: autopartId,
    );
  }
}
