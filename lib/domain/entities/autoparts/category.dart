class Category {
  final int id;
  final String name;
  final String description;
  final String asset;
  final String type;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.asset,
    required this.type,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      asset: map['asset'],
      description: map['description'],
      name: map['name'],
      type: map['type'],
    );
  }
}