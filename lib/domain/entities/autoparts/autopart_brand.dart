class AutopartBrand {
  final int id;
  final String name;
  final String logo;

  AutopartBrand({
    required this.id,
    required this.name,
    required this.logo,
  });


  factory AutopartBrand.fromMap(Map<String, dynamic> map) {
    return AutopartBrand(
      id: map['id'],
      name: map['name'],
      logo: map['logo'],
    );
  }
}