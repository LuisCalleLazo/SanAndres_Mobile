import 'package:san_andres_mobile/domain/entities/autoparts/autopart_brand.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';

class AutopartBrandModel extends AutopartBrand {
  AutopartBrandModel(
      {required super.id, required super.name, required super.logo});

  factory AutopartBrandModel.fromJson(Map<String, dynamic> json) {
    return AutopartBrandModel(
        id: json['id'], name: json['name'], logo: json['logo']);
  }

  factory AutopartBrandModel.fromTableData(AutopartBrandTableData data) {
    return AutopartBrandModel(
      id: data.refId ?? 0,
      name: data.name,
      logo: data.logo,
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
