import 'package:colonial/src/models/product.dart';
import 'package:colonial/src/utils/image_utils.dart';

List<Produto> produtos = [
  Produto("Compota", getImagePath("products/compota.jpg"), "15 Dias", 9.98),
  Produto("Linguiça", getImagePath("products/Linguiça.jpg"), "5 Dias", 28.90),
  Produto("Melado", getImagePath("products/melado.jpg"), "90 Dias", 19.90),
  Produto("Queijo", getImagePath("products/Queijo_colonial.jpg"), "10 Dias", 44.90),
  Produto("Torresmo", getImagePath("products/torresmo.jpg"), "60 Dias", 15.95)
];
