

import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';

class AutopartCategoryModel extends AutopartCategory{
  AutopartCategoryModel({
    required super.id,
    required super.name,
    super.description
  });

  factory AutopartCategoryModel.fromJson(Map<String, dynamic> json) {
    return AutopartCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description']
    );
  }

  factory AutopartCategoryModel.fromTableData(CategoryTableData data) {
    return AutopartCategoryModel(
      id: data.refId,
      name: data.name,
      description: data.description,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
