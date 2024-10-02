class KartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  KartItem({required this.id, required this.name, required this.price, this.quantity = 1});

}