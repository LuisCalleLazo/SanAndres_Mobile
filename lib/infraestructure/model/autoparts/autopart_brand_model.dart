

import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
class AutopartBrandModel extends AutopartBrand{
  AutopartBrandModel({
    required super.id,
    required super.name,
    required super.logo
  });

  factory AutopartBrandModel.fromJson(Map<String, dynamic> json) {
    return AutopartBrandModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }
}
