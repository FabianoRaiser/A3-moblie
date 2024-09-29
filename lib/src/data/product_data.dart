import 'package:colonial/src/models/product.dart';
import 'package:colonial/src/utils/image_utils.dart';

List<Produto> produtosCatalog = [
  Produto(
      id: "prod_01",
      name: "Compota",
      linkImagen: getImagePath("products/compota.jpg"),
      validade: "15 Dias",
      price: 9.98),
  Produto(
      id: "prod_02",
      name: "Linguiça",
      linkImagen: getImagePath("products/Linguiça.jpg"),
      validade: "5 Dias",
      price: 28.90),
  Produto(
      id: "prod_03",
      name: "Melado",
      linkImagen: getImagePath("products/melado.jpg"),
      validade: "90 Dias",
      price: 19.90),
  Produto(
      id: "prod_04",
      name: "Queijo",
      linkImagen: getImagePath("products/Queijo_colonial.jpg"),
      validade: "10 Dias",
      price: 44.90),
  Produto(
      id: "prod_05",
      name: "Torresmo",
      linkImagen: getImagePath("products/torresmo.jpg"),
      validade: "60 Dias",
      price: 15.95)
];
