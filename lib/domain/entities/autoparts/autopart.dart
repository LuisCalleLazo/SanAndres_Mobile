import 'package:san_andres_mobile/infraestructure/model/autopart_model.dart';

class Autopart {
  final int id;
  final int brandId;
  final int categoryId;
  Autopart({
    required this.id,
    required this.brandId,
    required this.categoryId,
  });

  factory Autopart.fromMap(Map<String, dynamic> map) {
    return Autopart(
      id: map['id'],
      brandId: map['brandId'],
      categoryId: map['categoryId'],
    );
  }
}

class AutopartList {
  final int id;
  final String category;
  final List<AutopartInfoList> info;

  AutopartList({
    required this.id,
    required this.category,
    required this.info,
  });

  factory AutopartList.fromMap(Map<String, dynamic> map) {
    var infoList = <AutopartInfoListModel>[];
    if (map['info'] != null) {
      // Se espera que 'info' sea List<Map<String, dynamic>>
      infoList = (map['info'] as List)
          .map((item) => AutopartInfoListModel.fromJson(item))
          .toList();
    }

    return AutopartList(
      id: map['id'] as int,
      category: map['category'] as String,
      info: infoList,
    );
  }

}

class AutopartAsset {
  final int id;
  final String asset;
  final String description;
  final int autopartId;

  AutopartAsset({
    required this.id,
    required this.asset,
    required this.description,
    required this.autopartId,
  });
}

class AutopartInfo {

  final int id;
  final String value;
  final int typeId;
  final String? typeName;
  final int autopartId;
  final int type;

  AutopartInfo({
    required this.id,
    required this.value,
    required this.typeId,
    this.typeName,
    required this.type,
    required this.autopartId,
  });
}


class AutopartInfoList {
  final String type;
  final String value;

  AutopartInfoList({
    required this.type,
    required this.value,
  });

}

class AutopartSearchList {

  final int id;
  final String name;
  final int categoryId;
  final String categoryName;
  final int brandId;
  final String brandName;
  final List<AutopartInfo> infos;
  final List<AutopartAsset> assets;

  AutopartSearchList({
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