
import 'dart:convert';

import 'package:colonial/src/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Produto>> getProdutos() async {
  final url = Uri.parse('http://10.0.2.2:3000/products');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((json) => Produto.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar produtos');
  }
}