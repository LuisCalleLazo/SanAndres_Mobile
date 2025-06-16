class SaleCustomer {
  final int id;
  final String seller;
  final int sellerId;
  final DateTime date;
  final double totalPrice;
  SaleCustomer({
    required this.id,
    required this.seller,
    required this.sellerId,
    required this.date,
    required this.totalPrice,
  });
}
