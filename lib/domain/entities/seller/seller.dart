class SellerByAutopart {
  final int id;
  final String nameSeller;
  final String nameCompany;
  final String phone;
  final String country;
  final String city;
  final String? photo;
  final int? unitsAvailable;
  final double retailPrice;
  final double wholesalePrice;
  SellerByAutopart({
    required this.id,
    required this.nameCompany,
    required this.nameSeller,
    required this.phone,
    required this.country,
    required this.city,
    this.photo,
    this.unitsAvailable,
    required this.retailPrice,
    required this.wholesalePrice,
  });
}