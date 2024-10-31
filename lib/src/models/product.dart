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
