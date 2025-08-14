class Autopart {
  final int id;
  final int brandId;
  final int categoryId;
  final String? name;

  Autopart({
    required this.id,
    required this.brandId,
    required this.categoryId,
    this.name,
  });
}

class AutopartAsset {
  final int id;
  final int autopartId;
  final String asset;
  final String description;

  AutopartAsset({
    required this.id,
    required this.description,
    required this.autopartId,
    required this.asset,
  });
}

class AutopartInfo {
  final int id;
  final int typeId;
  final int autopartId;
  final String value;

  AutopartInfo({
    required this.id,
    required this.typeId,
    required this.autopartId,
    required this.value,
  });
}
