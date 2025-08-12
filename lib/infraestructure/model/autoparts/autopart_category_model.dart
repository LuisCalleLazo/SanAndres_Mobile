

import 'package:san_andres_mobile/domain/entities/autoparts/autopart_category.dart';

class AutopartCategoryModel extends AutopartCategory{
  AutopartCategoryModel({
    required super.id,
    required super.name,
    required super.description
  });

  factory AutopartCategoryModel.fromJson(Map<String, dynamic> json) {
    return AutopartCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description']
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
