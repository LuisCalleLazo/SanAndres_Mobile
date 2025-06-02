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
