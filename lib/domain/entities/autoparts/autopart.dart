import 'package:san_andres_mobile/domain/entities/autoparts/autopart_info.dart';

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

  /// Este fromMap asume que el map contiene:
  /// - 'id' (int)
  /// - 'info' (List<Map<String, dynamic>>)
  factory AutopartList.fromMap(Map<String, dynamic> map) {
    var infoList = <AutopartInfoList>[];
    if (map['info'] != null) {
      // Se espera que 'info' sea List<Map<String, dynamic>>
      infoList = (map['info'] as List)
          .map((item) => AutopartInfoList.fromMap(item))
          .toList();
    }

    return AutopartList(
      id: map['id'] as int,
      category: map['category'] as String,
      info: infoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'info': info.map((e) => e.toMap()).toList(),
    };
  }
}