class Produto {
  final int id;
  final String name;
  final String linkImagen;
  final double price;

  Produto(
      {required this.id,
      required this.name,
      required this.linkImagen,
      required this.price});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      name: json['name'],
      linkImagen: json['imageUrl'],
      price: double.parse(json['price']),
    );
  }
}

class OrderItem {
  final int id;
  final int amount;

  OrderItem({required this.id, required this.amount});

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
  };
}
