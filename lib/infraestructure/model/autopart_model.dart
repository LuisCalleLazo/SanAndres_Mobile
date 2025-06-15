import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';

class AutopartSearchListModel extends AutopartSearchList {
  AutopartSearchListModel(
      {required super.id,
      required super.name,
      required super.categoryId,
      required super.categoryName,
      required super.brandId,
      required super.brandName,
      required super.infos,
      required super.assets});

  factory AutopartSearchListModel.fromJson(Map<String, dynamic> json) {
    return AutopartSearchListModel(
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
  AutopartSearchList toEntity() {
    return AutopartSearchList(
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

class AutopartAssetModel extends AutopartAsset {
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

  AutopartAsset toEntity() {
    return AutopartAsset(
      id: id,
      asset: asset,
      description: description,
      autopartId: autopartId,
    );
  }
}

class AutopartInfoModel extends AutopartInfo {
  AutopartInfoModel({
    required super.id,
    required super.value,
    required super.typeId,
    required super.typeName,
    required super.type,
    required super.autopartId,
  });

  factory AutopartInfoModel.fromJson(Map<String, dynamic> json) {
    return AutopartInfoModel(
      id: json['id'],
      value: json['value'] ?? '',
      typeId: json['typeId'] ?? 0,
      typeName: json['typeName'] ?? 0,
      type: json['type'] ?? 0,
      autopartId: json['autopartId'] ?? 0,
    );
  }
  AutopartInfo toEntity() {
    return AutopartInfo(
      id: id,
      value: value,
      typeId: typeId,
      typeName: typeName,
      type: type,
      autopartId: autopartId
    );
  }
}

class AutopartInfoListModel extends AutopartInfoList {
  AutopartInfoListModel({
    required super.type,
    required super.value,
  });

  factory AutopartInfoListModel.fromJson(Map<String, dynamic> map) {
    return AutopartInfoListModel(
      type: map['type'] as String,
      value: map['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }
}
