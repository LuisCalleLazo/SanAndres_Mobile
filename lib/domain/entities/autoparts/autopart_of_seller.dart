class AutopartOfSeller {
  final int id;
  final int autopartId;
  final int sellerId;
  final int amountUnit;
  final int amountUnitPublic;
  final double unitPrice;
  final double unitPricePublic;
  AutopartOfSeller({
    required this.id,
    required this.autopartId,
    required this.sellerId,
    required this.amountUnit,
    required this.amountUnitPublic,
    required this.unitPrice,
    required this.unitPricePublic
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

  factory AutopartOfSeller.fromMap(Map<String, dynamic> map) {
    return AutopartOfSeller(
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