import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';

class AutopartTypeInfoModel extends AutopartTypeInfo {
  AutopartTypeInfoModel({
    required super.id,
    required super.name,
    required super.description,
    required super.typeValue,
  });

  factory AutopartTypeInfoModel.fromJson(Map<String, dynamic> json) {
    return AutopartTypeInfoModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      typeValue: json['typeValye']
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
