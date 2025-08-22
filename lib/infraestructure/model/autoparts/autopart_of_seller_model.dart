import 'package:san_andres_mobile/domain/entities/autoparts/autopart_of_seller.dart';

class AutopartOfSellerModel extends AutopartOfSeller {
  AutopartOfSellerModel({
    required super.id,
    required super.autopartId,
    required super.sellerId,
    required super.amountUnit,
    required super.amountUnitPublic,
    required super.unitPrice,
    required super.unitPricePublic,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'autopartId': autopartId,
      'sellerId': sellerId,
      'amountUnit': amountUnit,
      'amountUnitPublic': amountUnitPublic,
      'unitPrice': unitPrice,
      'unitPricePublic': unitPricePublic,
    };
  }

  factory AutopartOfSellerModel.fromMap(Map<String, dynamic> map) {
    return AutopartOfSellerModel(
      id: map['id'],
      autopartId: map['autopartId'],
      sellerId: map['sellerId'],
      amountUnit: map['amountUnit'],
      amountUnitPublic: map['amountUnitPublic'],
      unitPrice: (map['unitPrice'] as num).toDouble(),
      unitPricePublic: (map['unitPricePublic'] as num).toDouble(),
    );
  }
}
