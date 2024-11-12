import 'dart:convert';

import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:colonial/src/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> newOrder(int customerId, String customerAddress,
    List<OrderItem> products, ShoppingKartProvider cartProvider) async {
  final url = Uri.parse("http://10.0.2.2:3000/orders");

  final headers = {'Content-Type': 'application/json'};



  final body = jsonEncode({
    'address': customerAddress,
    'customerId': customerId,
    'products': products
  });

  print(body);

  final response = await http.post(url, headers: headers, body: body);
  
  if (response.statusCode == 201) {
    print('Sucesso');
  } else {
    print("deu erro");
  }

  cartProvider.cleanCart();
}

Future<List<Map<String, dynamic>>> getOrders(int customerId) async {
  final url = Uri.parse('http://10.0.2.2:3000/customers/$customerId/orders/'); // Substitua pelo endereço da sua API
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.cast<Map<String, dynamic>>();
  } else {
    // Trate o erro da requisição
    print('Erro na requisição: ${response.statusCode}');
    return [];
  }
}
