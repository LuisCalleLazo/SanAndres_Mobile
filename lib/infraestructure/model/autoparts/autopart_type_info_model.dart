import 'package:san_andres_mobile/domain/entities/autoparts/autopart_type_info.dart';
import 'package:san_andres_mobile/infraestructure/database/database.dart';

class AutopartTypeInfoModel extends AutopartTypeInfo {
  AutopartTypeInfoModel({
    required super.id,
    required super.name,
    required super.description,
    required super.type,
  });

  factory AutopartTypeInfoModel.fromJson(Map<String, dynamic> json) {
    return AutopartTypeInfoModel(
      id: json['id'],
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      type: AutopartTypeInfoEnum.values[json['typeValue']],
    );
  }

  factory AutopartTypeInfoModel.fromTableData(AutopartTypeInfoTableData data) {
    return AutopartTypeInfoModel(
        id: data.refId ?? 0,
        name: data.name,
        description: data.description ?? "",
        type: data.type);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type,
    };
  }
}
